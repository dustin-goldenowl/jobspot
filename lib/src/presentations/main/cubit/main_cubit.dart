import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/service/firebase_messaging_service.dart';
import 'package:jobspot/src/presentations/main/widgets/bottom_sheet_post_option_view.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart';

part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  MainCubit(this._updateTokenUseCase) : super(const MainState());

  final UpdateTokenUseCase _updateTokenUseCase;

  Future updateToken() async {
    final token = await FirebaseMessagingService.getToken();
    _updateTokenUseCase.call(params: token ?? "");
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => const BottomSheetPostOptionView(),
    );
  }
}
