import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<ChangeSaveJobEvent>(
        (event, emit) => emit(ChangeSaveJobState(event.jobID)));

    on<DeleteAllSaveJob>((event, emit) => emit(DeleteAllSaveJobState()));

    on<ChangeJobEvent>((event, emit) => emit(ChangeJobState()));

    on<ChangeUserInfoEvent>((event, emit) => emit(ChangeUserInfoState()));
  }
}
