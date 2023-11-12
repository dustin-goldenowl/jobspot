part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {}

class ChangeSaveJobEvent extends AppEvent {
  final String jobID;

  ChangeSaveJobEvent(this.jobID);

  @override
  List<Object?> get props => [jobID, identityHashCode(this)];
}

class DeleteAllSaveJob extends AppEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeJobEvent extends AppEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeUserInfoEvent extends AppEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
