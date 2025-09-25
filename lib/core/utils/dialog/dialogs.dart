import 'package:flutter/material.dart';
import 'package:kk_movie_app/common/widgets/button/base_elevated_button.dart';
import 'package:kk_movie_app/l10n/l10n.dart';

class Dialogs {
  Dialogs._();
  static void showErrorDialog({
    required BuildContext context,
    required String message,
    required String title,
    required VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          actions: [
            Center(
              child: BaseElevatedButton(
                onPressed:onPressed,
                title: S.current.OK,
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}
