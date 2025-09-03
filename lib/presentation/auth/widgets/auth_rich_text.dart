import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRichText extends StatelessWidget {
  final String prefixText;
  final String actionText;
  final VoidCallback onTap;

  const AuthRichText({
    super.key,
    required this.prefixText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: prefixText,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        children: [
          const WidgetSpan(child: SizedBox(width: 4.0)),
          TextSpan(
            text: actionText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: (TapGestureRecognizer()..onTap = onTap),
          ),
        ],
      ),
    );
  }
}
