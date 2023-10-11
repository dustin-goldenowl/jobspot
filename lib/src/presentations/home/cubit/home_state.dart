part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.error, this.data});

  final FetchJobData? data;
  final String? error;

  HomeState copyWith({
    FetchJobData? data,
    String? error,
  }) {
    return HomeState(error: error, data: data);
  }

  @override
  List<Object?> get props => [data, error];
}
