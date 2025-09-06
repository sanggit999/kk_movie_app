import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/base_elevated_button.dart';
import 'package:kk_movie_app/common/widgets/base_text_form_field.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';
import 'package:kk_movie_app/presentation/auth/validator/form_validator.dart';
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
      appBar: BaseAppBar(title: Text(S.current.signUp)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  context.go(AppRoutes.home);
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
                    children: [
                      const SizedBox(),
                      BaseTextFormField(
                        controller: nameController,
                        hintText: S.current.name,
                        keyboardType: TextInputType.name,
                        validator: FormValidators.validateName,
                      ),
                      BaseTextFormField(
                        controller: emailController,
                        hintText: S.current.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: FormValidators.validateEmail,
                      ),
                      BaseTextFormField(
                        controller: pwController,
                        hintText: S.current.password,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: FormValidators.validatePassword,
                      ),
                      BaseTextFormField(
                        controller: confirmPwController,
                        hintText: S.current.confirmPassword,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) =>
                            FormValidators.validateConfirmPassword(
                              value,
                              pwController.text,
                            ),
                      ),
                      const SizedBox(height: 20.0),
                      BaseElevatedButton(
                        title: S.current.signUp,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().signup(
                              UserSignUpReq(
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
                          print('SignUp now tapped');
                        },
                        prefixText: S.current.haveAccount,
                        actionText: S.current.signIn,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
