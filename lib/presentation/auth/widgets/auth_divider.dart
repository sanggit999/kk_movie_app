import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  final String text;

  const AuthDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.tertiary,
            thickness: 2.0,
            endIndent: 10.0,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.tertiary,
            thickness: 2.0,
            indent: 10.0,
          ),
        ),
      ],
    );
  }
}
