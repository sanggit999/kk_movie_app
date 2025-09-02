import 'package:flutter/material.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/text_form_field/base_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        hideLeading: true,
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseTextFormField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),

          BaseTextFormField(
            hintText: 'Password',
            keyboardType: TextInputType.emailAddress,
          )
        ],
      ),
    );
  }
}
