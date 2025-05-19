import 'package:event_app/module/presentation/login/cubit/toogle/toogle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToogleCubit extends Cubit<ToogleState>{
  ToogleCubit() : super(const ToogleState());

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void toggleRememberMe() {
    emit(state.copyWith(isRememberMe: !state.isRememberMe));
  }
}