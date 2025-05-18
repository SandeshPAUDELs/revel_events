import 'package:event_app/module/presentation/form/cubit/form/text_fields_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFieldsCubit extends Cubit<TextFieldsState> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  TextFieldsCubit()
    : super(
        const TextFieldsInitialState(
          instructions: [
            'You need to fill your email',
            'You need to fill your password',
          ],
        ),
      );

  void loadInstructions() {
    emit(state.copyWith(instructions: []));
  }

  Future<void> submitTextFields() async {
    emit(const TextFieldsLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    try {
      if (formKey.currentState!.saveAndValidate()) {
        final username = formKey.currentState!.value['username'];
        final password = formKey.currentState!.value['password'];

        if (username.toLowerCase() == 'hello@gmail.com' &&
            password == 'kale12345') {
          emit(const TextFieldsLoadedState());
        } else {
          for (var field in ['username', 'password']) {
            formKey.currentState!.fields[field]?.invalidate(
              "Invalid email or password",
            );
          }
          emit(const TextFieldsErrorState(message: 'Invalid credentials'));
        }
      }
    } catch (e) {
      emit(TextFieldsErrorState(message: e.toString()));
    }
  }
}
