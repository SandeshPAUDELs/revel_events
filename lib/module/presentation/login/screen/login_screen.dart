import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/routes/routes_name.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/login/cubit/login/login_cubit.dart';
import 'package:event_app/module/presentation/login/cubit/login/login_state.dart';
import 'package:event_app/module/presentation/login/cubit/toogle/toogle_cubit.dart';
import 'package:event_app/module/presentation/login/cubit/toogle/toogle_state.dart';
import 'package:event_app/module/presentation/login/widgets/instruction_widget.dart';
import 'package:event_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => ToogleCubit()),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginLoadedState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Login successful')));
            context.go(RoutesName.eventScreeen);
          } else if (state is LoginErrorState) {
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
                      key: context.read<LoginCubit>().formKey,
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
                                context.read<LoginCubit>().emailFocusNode,
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
                                    .read<LoginCubit>()
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
                        context.read<LoginCubit>().submitLogin();
                      },
                      child: const Text('Submit'),
                    ),

                    SizedBox(height: 45),
                    GestureDetector(
                      onTap:
                          () => showDialog(
                            context: context,
                            builder: (context) {
                              return InstructionWidget(
                                instructions: state.instructions,
                              );
                            },
                          ),
                      child: Text(
                        'Get Instruction',
                        style: textTheme.bodyMedium,
                      ),
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
