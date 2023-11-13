import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/share_post_use_case.dart';
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'view_post_test.mocks.dart';

class MockPostEntity extends Mock implements PostEntity {}

class MockSharePostEntity extends Mock implements SharePostEntity {}

@GenerateMocks([
  FetchDataCommentFirstLevelUseCase,
  SyncPostDataUseCase,
  SendCommentUseCase,
  FavouritePostUseCase,
  FavouriteCommentUseCase,
  ReplyCommentUseCase,
  GetReplyCommentUseCase,
  DeleteCommentUseCase,
  SharePostUseCase,
  DeletePostUseCase,
])
void main() {
  late ViewPostBloc viewPostBloc;
  late MockFetchDataCommentFirstLevelUseCase
      mockFetchDataCommentFirstLevelUseCase;
  late MockSyncPostDataUseCase mockSyncPostDataUseCase;
  late MockSendCommentUseCase mockSendCommentUseCase;
  late MockFavouriteCommentUseCase mockFavouriteCommentUseCase;
  late MockFavouritePostUseCase mockFavouritePostUseCase;
  late MockReplyCommentUseCase mockReplyCommentUseCase;
  late MockGetReplyCommentUseCase mockGetReplyCommentUseCase;
  late MockDeleteCommentUseCase mockDeleteCommentUseCase;
  late MockSharePostUseCase mockSharePostUseCase;
  late MockDeletePostUseCase mockDeletePostUseCase;

  setUp(() {
    mockDeleteCommentUseCase = MockDeleteCommentUseCase();
    mockDeletePostUseCase = MockDeletePostUseCase();
    mockGetReplyCommentUseCase = MockGetReplyCommentUseCase();
    mockSharePostUseCase = MockSharePostUseCase();
    mockFavouriteCommentUseCase = MockFavouriteCommentUseCase();
    mockFavouritePostUseCase = MockFavouritePostUseCase();
    mockFetchDataCommentFirstLevelUseCase =
        MockFetchDataCommentFirstLevelUseCase();
    mockReplyCommentUseCase = MockReplyCommentUseCase();
    mockSendCommentUseCase = MockSendCommentUseCase();
    mockSyncPostDataUseCase = MockSyncPostDataUseCase();
    viewPostBloc = ViewPostBloc(
      mockFetchDataCommentFirstLevelUseCase,
      mockFavouriteCommentUseCase,
      mockFavouritePostUseCase,
      mockSendCommentUseCase,
      mockSyncPostDataUseCase,
      mockReplyCommentUseCase,
      mockGetReplyCommentUseCase,
      mockDeleteCommentUseCase,
      mockSharePostUseCase,
      mockDeletePostUseCase,
    );
  });

  group("Test View Post", () {
    blocTest<ViewPostBloc, ViewPostState>(
      'Test Delete Comment',
      setUp: () {
        when(mockDeleteCommentUseCase.call(params: "commentID"))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(DeleteCommentEvent("commentID"));
      },
      expect: () => [],
    );

    blocTest<ViewPostBloc, ViewPostState>(
      'Test Delete Post',
      setUp: () {
        when(mockDeletePostUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(DeletePostEvent(MockPostEntity()));
      },
      expect: () => [DeletePostSuccess()],
    );

    blocTest<ViewPostBloc, ViewPostState>(
      'Test Get Reply Comment',
      setUp: () {
        when(mockGetReplyCommentUseCase.call(params: "commentID"))
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(ViewReplyCommentEvent(commentID: "commentID"));
      },
      expect: () => [
        ViewReplyCommentLoading("commentID"),
        ViewReplyCommentSuccess(commentID: "commentID", listComment: const []),
      ],
    );

    blocTest<ViewPostBloc, ViewPostState>(
      'Test Share Post',
      setUp: () {
        when(mockSharePostUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(SharePostEvent(MockSharePostEntity()));
      },
      expect: () => [SharePostSuccess()],
    );

    blocTest<ViewPostBloc, ViewPostState>(
      'Test Share Post',
      setUp: () {
        when(mockSharePostUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(SharePostEvent(MockSharePostEntity()));
      },
      expect: () => [SharePostSuccess()],
    );

    blocTest<ViewPostBloc, ViewPostState>(
      'Test Favourite Post',
      setUp: () {
        when(mockFavouritePostUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(FavouritePostEvent(const []));
      },
      expect: () => [],
    );

    blocTest<ViewPostBloc, ViewPostState>(
      'Test Get List Comment',
      setUp: () {
        when(mockFetchDataCommentFirstLevelUseCase.call(
                params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(GetListCommentEvent(listComment: const []));
      },
      expect: () => [GetCommentDataSuccess(const [])],
    );

    blocTest<ViewPostBloc, ViewPostState>(
      'Test Get List Comment',
      setUp: () {
        when(mockSendCommentUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewPostBloc,
      act: (bloc) {
        bloc.add(SendCommentEvent());
      },
      expect: () => [ChangeTextCommentState()],
    );
  });
}
