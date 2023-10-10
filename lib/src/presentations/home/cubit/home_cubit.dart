import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/presentations/home/domain/entities/fetch_job_data.dart';
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final FetchJobUseCase _useCase;
  StreamSubscription? _subscription;

  HomeCubit(this._useCase) : super(const HomeState());

  void fetchJobData() {
    emit(state.copyWith());
    if (_subscription != null) _subscription!.cancel();
    _subscription = _useCase.call().listen((event) {
      emit(state.copyWith(data: event.data, error: event.error));
    });
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription!.cancel();
    return super.close();
  }
}
