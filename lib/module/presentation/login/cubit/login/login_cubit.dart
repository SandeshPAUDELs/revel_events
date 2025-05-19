import 'package:event_app/module/presentation/login/cubit/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  LoginCubit()
    : super(
        const LoginInitialState(
          instructions: [
            'You need to fill your email as : hello@gmail.com',
            'You need to fill your password as : kale12345',
          ],
        ),
      );

  void loadInstructions() {
    emit(state.copyWith(instructions: []));
  }

  Future<void> submitLogin() async {
    emit(const LoginLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    try {
      if (formKey.currentState!.saveAndValidate()) {
        final username = formKey.currentState!.value['username'];
        final password = formKey.currentState!.value['password'];

        if (username.toLowerCase() == 'hello@gmail.com' &&
            password == 'kale12345') {
          emit(const LoginLoadedState());
        } else {
          for (var field in ['username', 'password']) {
            formKey.currentState!.fields[field]?.invalidate(
              "Invalid email or password",
            );
          }
          emit(const LoginErrorState(message: 'Invalid credentials'));
        }
      }
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  }
}
