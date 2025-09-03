import 'package:flutter/material.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/base_elevated_button.dart';
import 'package:kk_movie_app/common/widgets/base_text_form_field.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_divider.dart';
import 'package:kk_movie_app/presentation/auth/widgets/auth_rich_text.dart';
import 'package:kk_movie_app/presentation/auth/widgets/google_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(hideLeading: true, title: Text(S.current.signUp)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 20.0,
              children: [
                SizedBox(),
                BaseTextFormField(
                  hintText: S.current.name,
                  keyboardType: TextInputType.name,
                ),
                BaseTextFormField(
                  hintText: S.current.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                BaseTextFormField(
                  hintText: S.current.password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                BaseTextFormField(
                  hintText: S.current.confirmPassword,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                BaseElevatedButton(
                  title: S.current.signUp,
                  onPressed: () {
                    print('Signup button pressed');
                  },
                ),
                AuthDivider(text: S.current.orSignUpWith),
                GoogleButton(
                  onTap: () {
                    print('Google Sign-In button tapped');
                  },
                ),
                AuthRichText(
                  onTap: () {
                    print('SignUp now tapped');
                  },
                  prefixText: S.current.haveAccount,
                  actionText: S.current.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
