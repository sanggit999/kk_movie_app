import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/base_elevated_button.dart';
import 'package:kk_movie_app/common/widgets/base_text_form_field.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';
import 'package:kk_movie_app/presentation/auth/validator/form_validator.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(S.current.forgotPassword)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthForgotPasswordSuccess) {
              context.go(AppRoutes.signin);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Form(
              key: formKey,
              child: Column(
                spacing: 20.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseTextFormField(
                    controller: emailController,
                    hintText: S.current.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: FormValidators.validateEmail,
                  ),
                  const SizedBox(height: 20.0),
                  BaseElevatedButton(
                    title: S.current.resetPassword,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().forgotPassword(
                          emailController.text,
                        );
                        print('Reset password button pressed');
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
