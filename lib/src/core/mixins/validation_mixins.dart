// Flutter imports:
import 'package:flutter/material.dart';

mixin ValidatorsMixin {
  final RegExp _email = RegExp(
      r"^((([a-z]|\d|[!#\$%&'*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
  final _phone = RegExp("^(\\+234[7-9]|234[7-9]|08|09|07|[7-9])\\d{9}\$");
  final _phoneNoReg = RegExp(r"^(08|09|07)\d{9}$");
  final _password = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
  final _pin = RegExp(r'^[0-9]{1,4}$');

  @protected
  bool isNotNull(dynamic value) {
    if (value is Map || value is List) return value.isNotEmpty;
    if (value is String) return !isEmpty(value);
    return (value != null);
  }

  @protected
  bool isNull(dynamic value) {
    return !isNotNull(value);
  }

  @protected
  bool isPasswordValid(String str) {
    return isNotEmpty(str) && _password.hasMatch(str);
  }

  @protected
  bool isEmail(String str) {
    return _email.hasMatch(str.toLowerCase());
  }

  @protected
  bool isPin(String? pin) {
    return isNotEmpty(pin) && _pin.hasMatch(pin!);
  }

  @protected
  bool isPhoneNumber(String str) {
    return _phone.hasMatch(str);
  }

  @protected
  bool isPhoneNo(String str) {
    return _phoneNoReg.hasMatch(str);
  }

  @protected
  bool isEmpty(String? text) {
    return text == null || text.trim().isEmpty;
  }

  @protected
  bool isNotEmpty(String? text) {
    return !isEmpty(text);
  }

  @protected
  bool isEmailValid(String? email) {
    return !isEmpty(email) && isEmail(email!);
  }

  @protected
  bool isPhoneNumberValid(String? text) {
    return !isEmpty(text) && isPhoneNumber(text!);
  }

  @protected
  bool isNameValid(String? text) {
    return !isEmpty(text) && text!.length > 1;
  }

  @protected
  bool isAirtimePhoneNumberValid(String? text) {
    return !isEmpty(text) && isPhoneNo(text!);
  }

  @protected
  bool isBVNValid(String? text) {
    return !isEmpty(text) && (text!.length == 11);
  }

  @protected
  bool isAccountNumberValid(String? text) {
    return !isEmpty(text) && (text!.length == 10);
  }

  @protected
  bool isDobValid(String? input) {
    // Remove any non-numeric characters from the input
    String? numericInput = input!.replaceAll(RegExp(r'/D'), '');

    // Validate the length of the numeric input
    if (numericInput.length != 8) {
      return false;
    }

    // Extract the day, month, and year components
    int? day = int.tryParse(numericInput.substring(0, 2));
    int? month = int.tryParse(numericInput.substring(2, 4));
    int? year = int.tryParse(numericInput.substring(4, 8));

    // Validate the day, month, and year components
    if (day == null || month == null || year == null) {
      return false;
    }

    // Validate the date components
    if (day < 1 || day > 31 || month < 1 || month > 12 || year < 1900) {
      return false;
    }

    // Ensure that the year is not less than 5 years ago
    DateTime now = DateTime.now();
    DateTime inputDate = DateTime(year, month, day);
    if (inputDate.isAfter(now.subtract(const Duration(days: 365 * 5)))) {
      return false;
    }
    // Additional validation logic can be added if needed

    return true;
  }

  @protected
  bool hasConsecutiveNumbers(String? text) {
    final numValue = int.tryParse(text ?? '');
    if (numValue == null) return false;
    final numList = numValue.toString().split('').map(int.parse).toList();
    if (numList.length <= 1) return false;

    final diff = <int>{};
    for (var i = 0; i < numList.length; i++) {
      if (i == 0) continue;
      diff.add(numList[i] - numList[i - 1]);
    }

    return diff.length == 1 && diff.first == 1;
  }

  @protected
  bool hasSameNumbers(String? text) {
    return text?.split('').toSet().length == 1;
  }
}
