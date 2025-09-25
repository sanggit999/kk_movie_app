// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `KK Movies`
  String get appTitle {
    return Intl.message('KK Movies', name: 'appTitle', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign out`
  String get signOut {
    return Intl.message('Sign out', name: 'signOut', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Watchlist`
  String get watchlist {
    return Intl.message('Watchlist', name: 'watchlist', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get noAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get haveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get orSignInWith {
    return Intl.message(
      'Or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get orSignUpWith {
    return Intl.message(
      'Or sign up with',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get nameEmpty {
    return Intl.message(
      'Name cannot be empty',
      name: 'nameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name is too long`
  String get nameTooLong {
    return Intl.message(
      'Name is too long',
      name: 'nameTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get emailEmpty {
    return Intl.message(
      'Email cannot be empty',
      name: 'emailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email is invalid`
  String get emailInvalid {
    return Intl.message(
      'Email is invalid',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get passwordEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'passwordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must include uppercase,\nlowercase letters and a number`
  String get passwordInvalidFormat {
    return Intl.message(
      'Password must include uppercase,\nlowercase letters and a number',
      name: 'passwordInvalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Password contains invalid characters`
  String get passwordInvalidChar {
    return Intl.message(
      'Password contains invalid characters',
      name: 'passwordInvalidChar',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password cannot be empty`
  String get confirmPasswordEmpty {
    return Intl.message(
      'Confirm password cannot be empty',
      name: 'confirmPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password does not match`
  String get confirmPasswordMismatch {
    return Intl.message(
      'Confirm password does not match',
      name: 'confirmPasswordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `User disabled`
  String get userDisabled {
    return Intl.message(
      'User disabled',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already in use`
  String get emailAlreadyInUse {
    return Intl.message(
      'The email address is already in use',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `This operation is not allowed`
  String get operationNotAllowed {
    return Intl.message(
      'This operation is not allowed',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak`
  String get weakPassword {
    return Intl.message(
      'The password is too weak',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get invalidCredential {
    return Intl.message(
      'Invalid email or password',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Password reset request successful. Please check your email (including the spam folder).`
  String get resetPasswordRequestSuccess {
    return Intl.message(
      'Password reset request successful. Please check your email (including the spam folder).',
      name: 'resetPasswordRequestSuccess',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get OK {
    return Intl.message('OK', name: 'OK', desc: '', args: []);
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `No connection`
  String get noConnection {
    return Intl.message(
      'No connection',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Go back online`
  String get goOnline {
    return Intl.message('Go back online', name: 'goOnline', desc: '', args: []);
  }

  /// `TV Series`
  String get tvSeries {
    return Intl.message('TV Series', name: 'tvSeries', desc: '', args: []);
  }

  /// `Movie`
  String get movie {
    return Intl.message('Movie', name: 'movie', desc: '', args: []);
  }

  /// `Cartoon`
  String get cartoon {
    return Intl.message('Cartoon', name: 'cartoon', desc: '', args: []);
  }

  /// `View all`
  String get viewAll {
    return Intl.message('View all', name: 'viewAll', desc: '', args: []);
  }

  /// `Latest`
  String get latest {
    return Intl.message('Latest', name: 'latest', desc: '', args: []);
  }

  /// `Oldest`
  String get oldest {
    return Intl.message('Oldest', name: 'oldest', desc: '', args: []);
  }

  /// `Vietsub`
  String get vietSub {
    return Intl.message('Vietsub', name: 'vietSub', desc: '', args: []);
  }

  /// `Subtitled`
  String get subtitled {
    return Intl.message('Subtitled', name: 'subtitled', desc: '', args: []);
  }

  /// `Dubbed`
  String get dubbed {
    return Intl.message('Dubbed', name: 'dubbed', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Total episodes`
  String get totalEpisodes {
    return Intl.message(
      'Total episodes',
      name: 'totalEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `Release year`
  String get releaseYear {
    return Intl.message(
      'Release year',
      name: 'releaseYear',
      desc: '',
      args: [],
    );
  }

  /// `Director`
  String get director {
    return Intl.message('Director', name: 'director', desc: '', args: []);
  }

  /// `Actor`
  String get actor {
    return Intl.message('Actor', name: 'actor', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Movie description`
  String get description {
    return Intl.message(
      'Movie description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Không có dữ liệu`
  String get noData {
    return Intl.message('Không có dữ liệu', name: 'noData', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message('Vietnamese', name: 'vietnamese', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
