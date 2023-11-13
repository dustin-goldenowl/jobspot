import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/share_post_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'connection_test.mocks.dart';

class MockFavouriteEntity extends Mock implements FavouriteEntity {}

class MockSharePostEntity extends Mock implements SharePostEntity {}

@GenerateMocks([FetchPostUseCase, FavouritePostUseCase, SharePostUseCase])
void main() {
  late ConnectionCubit connectionCubit;
  late MockFetchPostUseCase mockFetchPostUseCase;
  late MockFavouritePostUseCase mockFavouritePostUseCase;
  late MockSharePostUseCase mockSharePostUseCase;

  setUp(() {
    mockFavouritePostUseCase = MockFavouritePostUseCase();
    mockFetchPostUseCase = MockFetchPostUseCase();
    mockSharePostUseCase = MockSharePostUseCase();
    connectionCubit = ConnectionCubit(
      mockFetchPostUseCase,
      mockFavouritePostUseCase,
      mockSharePostUseCase,
    );
  });

  group("Test Connection", () {
    blocTest<ConnectionCubit, ConnectionState>(
      'Test Get Post',
      setUp: () {
        when(mockFetchPostUseCase.call(params: 15)).thenAnswer((_) =>
            Stream.value(DataSuccess(
                FetchLazyData(isMore: true, limit: 15, listData: []))));
      },
      build: () => connectionCubit,
      act: (bloc) => bloc.fetchPostData(),
      expect: () => [
        const ConnectionState(isMore: true, isLoading: false),
        const ConnectionState(isMore: true, isLoading: false, posts: [])
      ],
    );

    blocTest<ConnectionCubit, ConnectionState>(
      'Test Favourite Post',
      setUp: () {
        when(mockFavouritePostUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => connectionCubit,
      act: (bloc) => bloc.favouritePost(MockFavouriteEntity()),
      expect: () => [],
    );

    blocTest<ConnectionCubit, ConnectionState>(
      'Test Share Post',
      setUp: () {
        when(mockSharePostUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => connectionCubit,
      act: (bloc) => bloc.sharePost(MockSharePostEntity()),
      expect: () => [
        const ConnectionState(isMore: true, isLoading: true),
        const ConnectionState(isMore: true, isLoading: false)
      ],
    );
  });
}
