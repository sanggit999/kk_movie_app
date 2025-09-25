import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/cubit/execute_cubit.dart';
import 'package:kk_movie_app/common/cubit/execute_state.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/form_field/base_text_form_field.dart';
import 'package:kk_movie_app/core/utils/dialog/dialogs.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/usecases/send_password_reset_email_usecase.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/core/utils/validator/validators.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_button.dart';
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
      appBar: BaseAppBar(
        hideLeading: false,
        centerTitle: false,
        title: Text(S.current.forgotPassword),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocListener<ExecuteCubit, ExecuteState>(
            listenWhen: (previous, current) {
              return current is ExecuteFailure || current is ExecuteSuccess;
            },
            listener: (context, state) {
              if (state is ExecuteFailure) {
                final message = switch (state.message) {
                  'no-connection' => S.current.noConnection,
                  _ => S.current.unknownError,
                };

                Dialogs.showErrorDialog(
                  context: context,
                  message: message,
                  title: S.current.notification,
                  onPressed: () => context.pop(),
                );
              }

              if (state is ExecuteSuccess) {
                Dialogs.showErrorDialog(
                  context: context,
                  message: S.current.resetPasswordRequestSuccess,
                  title: S.current.notification,
                  onPressed: () => context.go(AppRoutes.signin),
                );
              }
            },
            child: Form(
              key: formKey,
              child: Column(
                spacing: 20.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseTextFormField(
                    controller: emailController,
                    hintText: S.current.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 20.0),
                  AuthButton(
                    title: S.current.resetPassword,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ExecuteCubit>().execute<String, String>(
                          usecase: getIt<SendPasswordResetEmailUseCase>(),
                          params: emailController.text,
                        );
                        print('Reset password button pressed');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
