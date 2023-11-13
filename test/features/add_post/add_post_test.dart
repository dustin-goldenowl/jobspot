import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart';
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart';
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_post_test.mocks.dart';

@GenerateMocks([AddPostUseCase, UpdatePostUseCase])
void main() {
  late AddPostCubit addPostCubit;
  late MockAddPostUseCase mockAddPostUseCase;
  late MockUpdatePostUseCase mockUpdatePostUseCase;

  setUp(() {
    mockAddPostUseCase = MockAddPostUseCase();
    mockUpdatePostUseCase = MockUpdatePostUseCase();
    addPostCubit = AddPostCubit(mockAddPostUseCase, mockUpdatePostUseCase);
  });

  group("Test Add Post", () {
    blocTest<AddPostCubit, AddPostState>(
      'Test Update Post',
      setUp: () {
        when(mockUpdatePostUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addPostCubit,
      act: (bloc) => bloc.updatePost(),
      expect: () => [
        const AddPostState(isLoading: true, images: [], removeImages: []),
        const AddPostState(
          isLoading: false,
          images: [],
          removeImages: [],
          dataState: DataSuccess(true),
        ),
      ],
    );

    blocTest<AddPostCubit, AddPostState>(
      'Test Add Post',
      setUp: () {
        when(mockAddPostUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addPostCubit,
      act: (bloc) => bloc.addPost(),
      expect: () => [
        const AddPostState(isLoading: true, images: [], removeImages: []),
        const AddPostState(
          isLoading: false,
          images: [],
          removeImages: [],
          dataState: DataSuccess(true),
        ),
      ],
    );
  });
}
