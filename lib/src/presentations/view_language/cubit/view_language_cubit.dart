import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'view_language_state.dart';

class ViewLanguageCubit extends Cubit<ViewLanguageState> {
  ViewLanguageCubit() : super(const ViewLanguageState());
}
