import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/base_elevated_button.dart';
import 'package:kk_movie_app/common/widgets/base_text_form_field.dart';
import 'package:kk_movie_app/data/auth/models/user_login_req.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_divider.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_rich_text.dart';
import 'package:kk_movie_app/presentation/auth/widgets/google_button.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(hideLeading: true, title: Text(S.current.signIn)),
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
                      BaseTextFormField(
                        controller: emailController,
                        hintText: S.current.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      BaseTextFormField(
                        controller: pwController,
                        hintText: S.current.password,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.push(AppRoutes.forgotPassword);
                              print('Forgot Password tapped');
                            },
                            child: Text(
                              '${S.current.forgotPassword}?',
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      BaseElevatedButton(
                        title: S.current.signIn,
                        onPressed: () {
                          context.read<AuthCubit>().signin(
                            UserLoginReq(
                              email: emailController.text,
                              password: pwController.text,
                            ),
                          );
                          print('Login button pressed');
                        },
                      ),

                      AuthDivider(text: S.current.orSignInWith),

                      GoogleButton(
                        onTap: () {
                          context.read<AuthCubit>().signInWithGoogle();
                          print('Google Sign-In button tapped');
                        },
                      ),

                      AuthRichText(
                        onTap: () {
                          context.push(AppRoutes.signup);
                          print('SignUp now tapped');
                        },
                        prefixText: S.current.noAccount,
                        actionText: S.current.signUp,
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
