import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/routes/routes_name.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/form/cubit/form/text_fields_cubit.dart';
import 'package:event_app/module/presentation/form/cubit/form/text_fields_state.dart';
import 'package:event_app/module/presentation/form/cubit/form/toogle/toogle_cubit.dart';
import 'package:event_app/module/presentation/form/cubit/form/toogle/toogle_state.dart';
import 'package:event_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class TextFieldsFields extends StatelessWidget {
  const TextFieldsFields({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TextFieldsCubit>()),
        BlocProvider(create: (context) => ToogleCubit()),
      ],
      child: BlocConsumer<TextFieldsCubit, TextFieldsState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is TextFieldsLoadedState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Login successful')));
            context.go(RoutesName.eventScreeen);
          } else if (state is TextFieldsErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return BlocBuilder<ToogleCubit, ToogleState>(
            builder: (context, toogleState) {
              return Scaffold(
                backgroundColor: AppColors.buttonlevelSecondaryColor,
                body: Column(
                  children: [
                    FormBuilder(
                      key: context.read<TextFieldsCubit>().formKey,
                      child: Column(
                        children: [
                          Text('Email', style: textTheme.titleLarge),
                          FormBuilderTextField(
                            name: 'username',
                            decoration: InputDecoration(
                              hintText: 'hintText',
                              hintStyle: textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondaryColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(CommonStyle.borderRadius),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              filled: true,
                              fillColor: AppColors.cardSecondayColor,
                            ),
                            focusNode:
                                context.read<TextFieldsCubit>().emailFocusNode,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          Text('Password', style: textTheme.titleLarge),
                          FormBuilderTextField(
                            name: 'password',
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondaryColor,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  toogleState.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  context
                                      .read<ToogleCubit>()
                                      .togglePasswordVisibility();
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(CommonStyle.borderRadius),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              filled: true,
                              fillColor: AppColors.cardSecondayColor,
                            ),
                            focusNode:
                                context
                                    .read<TextFieldsCubit>()
                                    .passwordFocusNode,
                            obscureText: !toogleState.isPasswordVisible,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(8),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: toogleState.isRememberMe,
                              onChanged: (value) {
                                context.read<ToogleCubit>().toggleRememberMe();
                              },
                            ),
                            const Text('Remember me'),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TextFieldsCubit>().submitTextFields();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
