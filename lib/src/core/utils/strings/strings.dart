// Package imports:
import 'package:intl/intl.dart';

class Strings {
  static String serverError =
      Intl.message('A server error occurred', locale: 'en');
  static String genericErrorMessage =
      Intl.message('An error occurred', locale: 'en');
  static String titleErrorMessage = Intl.message('Failed', locale: 'en');
  static String connectionError =
      Intl.message('Please check your internet connection', locale: 'en');
  static String timeout =
      Intl.message('Your connection timed out', locale: 'en');
  static String personalInfo =
      Intl.message('Personal information', locale: 'en');
  static String enterLogin =
      Intl.message('Enter login details provided to get started', locale: 'en');
  static String enterNo = Intl.message('Enter number of shares', locale: 'en');
  static String hello = Intl.message('Hello', locale: 'en');
  static String welcomeBack = Intl.message('Welcome Back', locale: 'en');
  static String dontHaveAcc =
      Intl.message('Already have an account? ', locale: 'en');
  static String alreadyHaveAcc =
      Intl.message('Don’t have an account? ', locale: 'en');
  static String login = Intl.message('Login', locale: 'en');
  static String signUp = Intl.message('Sign up', locale: 'en');
  static String savePassword = Intl.message('Save Password', locale: 'en');
  static String newPassword = Intl.message('New Password', locale: 'en');
  static String newPasswordsub =
      Intl.message('Create new password', locale: 'en');
  static String userProfile = Intl.message('User Profile', locale: 'en');
  static String editUserProfile =
      Intl.message('Edit and save your personal details', locale: 'en');
  static String confirm = Intl.message('Confirm', locale: 'en');
  static String support = Intl.message('Support', locale: 'en');
  static String supportSub = Intl.message(
    'Feel free to lay any enquiries, requests or complains.',
    locale: 'en',
  );
  static String sessionExpired = Intl.message('Session Expired', locale: 'en');
  static String sessionExpiredSub =
      Intl.message('Your session has expired, please login again.');
  static String sidesId =
      Intl.message('6545022394b3aceac5be3e84', locale: 'en');
}
