import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final void Function()? onTap;

  const GoogleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
        ),
        child: Image.asset('assets/images/google.png', height: 32.0),
      ),
    );
  }
}
