import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/follow/cubit/follow_cubit.dart';
import 'package:jobspot/src/presentations/follow/domain/use_cases/get_list_follow_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'follow_test.mocks.dart';

@GenerateMocks([GetListFollowUseCase])
void main() {
  late FollowCubit followCubit;
  late MockGetListFollowUseCase mockGetListFollowUseCase;

  setUp(() {
    mockGetListFollowUseCase = MockGetListFollowUseCase();
    followCubit = FollowCubit(mockGetListFollowUseCase);
  });

  group("Test Follow", () {
    blocTest<FollowCubit, FollowState>(
      'Test Follower',
      setUp: () {
        when(mockGetListFollowUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => followCubit,
      act: (bloc) => bloc.getListFollower(),
      expect: () => [
        const FollowState(),
        const FollowState(listFollower: []),
      ],
    );

    blocTest<FollowCubit, FollowState>(
      'Test Following',
      setUp: () {
        when(mockGetListFollowUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => followCubit,
      act: (bloc) => bloc.getListFollowing(),
      expect: () => [
        const FollowState(),
        const FollowState(listFollowing: []),
      ],
    );
  });
}
