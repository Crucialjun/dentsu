import 'package:email_validator/email_validator.dart';

class AppTextFormFieldValidators {
  static String? validateEmailOrUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    bool isEmailValid = EmailValidator.validate(value);

    bool isValidUsername(String? value) =>
        RegExp('[a-zA-Z]').hasMatch(value ?? '');

    if (!isEmailValid && !isValidUsername(value)) {
      return 'Please enter a valid email or username';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateName(String? value) {
    final RegExp nameRegExp = RegExp('[a-zA-Z]');
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (!nameRegExp.hasMatch(value)) {
      return 'Name must contain only alphabets';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    bool isEmailValid = EmailValidator.validate(email);

    if (!isEmailValid) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validateConfirmPassword(
      {String? value, required String password}) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
