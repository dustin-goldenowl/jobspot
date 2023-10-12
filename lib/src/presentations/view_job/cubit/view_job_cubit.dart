import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart';

part 'view_job_state.dart';

@injectable
class ViewJobCubit extends Cubit<ViewJobState> {
  final FetchJobUseCase _useCase;

  String? _postID;

  ViewJobCubit(this._useCase) : super(const ViewJobState(isReadMore: false));

  Future fetchJobData([String? id]) async {
    _postID ??= id;
    emit(state.copyWith());
    final response = await _useCase.call(params: _postID!);
    emit(state.copyWith(dataState: response));
  }

  void readMore() =>
      emit(state.copyWith(dataState: state.dataState, isReadMore: true));
}
