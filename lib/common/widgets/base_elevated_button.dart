import 'package:flutter/material.dart';

class BaseElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final String title;
  final Color? backgroundColor;
  final BorderSide? side;

  const BaseElevatedButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    required this.title,
    this.backgroundColor,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.tertiary,
          width: 2.0,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 60.0,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
