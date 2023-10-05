part of 'main_cubit.dart';

class MainState extends Equatable {
  final int currentIndex;

  const MainState(this.currentIndex);

  MainState copyWith(int? index) => MainState(index ?? currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
