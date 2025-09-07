import 'package:kk_movie_app/l10n/l10n.dart';

class Validators {
  Validators._();

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.nameEmpty;
    }
    if (value.trim().length > 24) {
      return  S.current.nameTooLong;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return  S.current.emailEmpty;
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}"
      r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    if (!emailRegex.hasMatch(value)) {
      return  S.current.emailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return  S.current.passwordEmpty;
    }
    if (value.length < 8) {
      return S.current.passwordMinLength;
    }
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');
    if (!passwordRegex.hasMatch(value)) {
      return S.current.passwordInvalidFormat;
    }
    final allowedCharsRegex = RegExp(
      r'^((?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9]).{6,})\S$',
    );

    if (!allowedCharsRegex.hasMatch(value)) {
      return S.current.passwordInvalidChar;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return S.current.confirmPasswordEmpty;
    }
    if (value != password) {
      return S.current.confirmPasswordMismatch;
    }
    return null;
  }
}
