part of 'app_bloc.dart';

abstract class AppState extends Equatable {}

class AppInitial extends AppState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeSaveJobState extends AppState {
  final String jobID;

  ChangeSaveJobState(this.jobID);

  @override
  List<Object?> get props => [jobID, identityHashCode(this)];
}

class DeleteAllSaveJobState extends AppState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeJobState extends AppState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeUserInfoState extends AppState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
