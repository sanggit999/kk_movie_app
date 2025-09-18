import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/cubit/execute_cubit.dart';
import 'package:kk_movie_app/common/cubit/execute_state.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/base_text_form_field.dart';
import 'package:kk_movie_app/core/utils/dialog/dialogs.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/usecases/signup_usecase.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/core/utils/validator/validators.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_button.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_divider.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_rich_text.dart';
import 'package:kk_movie_app/presentation/auth/widgets/google_button.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(hideLeading: false, title: Text(S.current.signUp)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocListener<ExecuteCubit, ExecuteState>(
              listenWhen: (previous, current) {
                return current is ExecuteFailure || current is ExecuteSuccess;
              },
              listener: (context, state) {
                if (state is ExecuteFailure) {
                  final message = switch (state.message) {
                    'email-already-in-use' => S.current.emailAlreadyInUse,
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
                  context.go(AppRoutes.home);
                }
              },
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 20.0,
                  children: [
                    const SizedBox(),
                    BaseTextFormField(
                      controller: nameController,
                      hintText: S.current.name,
                      keyboardType: TextInputType.name,
                      validator: Validators.validateName,
                    ),
                    BaseTextFormField(
                      controller: emailController,
                      hintText: S.current.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.validateEmail,
                    ),
                    BaseTextFormField(
                      controller: pwController,
                      hintText: S.current.password,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: Validators.validatePassword,
                    ),
                    BaseTextFormField(
                      controller: confirmPwController,
                      hintText: S.current.confirmPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) => Validators.validateConfirmPassword(
                        value,
                        pwController.text,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AuthButton(
                      title: S.current.signUp,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<ExecuteCubit>()
                              .execute<UserEntity, UserSignUpReq>(
                                usecase: getIt<SignUpUseCase>(),
                                params: UserSignUpReq(
                                  email: emailController.text,
                                  password: pwController.text,
                                  name: nameController.text,
                                ),
                              );
                          print('Signup button pressed');
                        }
                      },
                    ),
                    AuthDivider(text: S.current.orSignUpWith),
                    GoogleButton(
                      onTap: () {
                        context.read<AuthCubit>().signInWithGoogle();
                        print('Google Sign-In button tapped');
                      },
                    ),
                    AuthRichText(
                      onTap: () {
                        context.pop();
                        print('SignUp now tapped');
                      },
                      prefixText: S.current.haveAccount,
                      actionText: S.current.signIn,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
