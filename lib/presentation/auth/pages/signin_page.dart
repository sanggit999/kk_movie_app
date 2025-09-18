import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/cubit/execute_cubit.dart';
import 'package:kk_movie_app/common/cubit/execute_state.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/base_text_form_field.dart';
import 'package:kk_movie_app/core/utils/dialog/dialogs.dart';
import 'package:kk_movie_app/data/auth/models/user_signin_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/usecases/signin_usecase.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/core/utils/validator/validators.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_button.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_divider.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_rich_text.dart';
import 'package:kk_movie_app/presentation/auth/widgets/google_button.dart';
import 'package:kk_movie_app/router/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    _loadCachedEmail();
  }

  Future<void> _loadCachedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedEmail = prefs.getString('cached_email') ?? '';
    emailController.text = cachedEmail;
  }

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
            child: BlocListener<ExecuteCubit, ExecuteState>(
              listenWhen: (previous, current) {
                print("buildWhen: $previous -> $current");
                return current is ExecuteFailure || current is ExecuteSuccess;
              },
              listener: (context, state) {
                if (state is ExecuteFailure) {
                  final message = switch (state.message) {
                    'invalid-credential' => S.current.invalidCredential,
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

                    AuthButton(
                      title: S.current.signIn,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<ExecuteCubit>()
                              .execute<UserEntity, UserSignInReq>(
                                usecase: getIt<SignInUseCase>(),
                                params: UserSignInReq(
                                  email: emailController.text,
                                  password: pwController.text,
                                ),
                              );
                          print('Login button pressed');
                        }
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
