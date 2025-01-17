import 'package:flutter/cupertino.dart';
import 'package:core_module/core/def/global_definitions.dart';

class ValidationUtils {
  static ValidationUtils? _utils;

  ValidationUtils._();

  factory ValidationUtils() {
    return _utils ??= ValidationUtils._();
  }

  void _showErrorSnack(String mess) {
    snackBarSnippet.snackBarError(mess);
  }

  bool isValidEmailAddress(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isValidPhone(String phone) {
    return RegExp(r"^(?:[+0])?[0-9]{9}").hasMatch(phone);
  }

  bool isStrongPassword(String password) {
    return RegExp(r"^(?=.*\d).{8,}").hasMatch(password);
  }

  String _getStringData(TextEditingController editingController) {
    return editingController.text.toString().trim();
  }

  ///-----------------------------------------------------------------------------

  bool validateDataEntry(TextEditingController entry,
      {String err = "One or more fields required", FocusNode? focusNode}) {
    if (_getStringData(entry).isEmpty) {
      _showErrorSnack(err);
      if (focusNode != null) {
        focusNode.requestFocus();
      }
      return false;
    }
    return true;
  }

  bool validateEntryPhone(
    TextEditingController entry, {
    String err = "Please enter a valid phone number.",
    FocusNode? focusNode,
    bool isValid = true,
  }) {
    if (!isValidPhone(numberUtils.cleanPhoneNumber(_getStringData(entry))) ||
        !isValid) {
      _showErrorSnack(err);
      if (focusNode != null) {
        focusNode.requestFocus();
      }
      return false;
    }
    return true;
  }

  bool validateEntryPassword(TextEditingController entry,
      {String err = "Please enter a strong password.", FocusNode? focusNode}) {
    if (!isStrongPassword(_getStringData(entry))) {
      _showErrorSnack(err);
      if (focusNode != null) {
        focusNode.requestFocus();
      }
      return false;
    }
    return true;
  }

  bool validateEntryEmail(TextEditingController entry,
      {String err = "Please enter a valid email address.",
      FocusNode? focusNode}) {
    if (_getStringData(entry).isNotEmpty) {
      if (!isValidEmailAddress(_getStringData(entry))) {
        _showErrorSnack(err);
        if (focusNode != null) {
          focusNode.requestFocus();
        }
        return false;
      }
    }
    return true;
  }

  bool validatePasswords(
      TextEditingController password, TextEditingController confirmPassword) {
    bool isValid = validateDataEntry(password, err: "Password required");
    if (isValid) {
      if (password.text.length < 6) {
        _showErrorSnack("Passwords length cannot be less than 6 characters.");
        isValid = false;
      } else if (_getStringData(password) != _getStringData(confirmPassword)) {
        _showErrorSnack("Passwords do not match.");
        isValid = false;
      } else {
        isValid = true;
      }
    }
    return isValid;
  }

  bool validateTermsAndCondition(bool isTermsConditionsChecked) {
    if (!isTermsConditionsChecked) {
      _showErrorSnack(
          "Please you need to agree to Prime Terms And Conditions.");
      return false;
    }
    return true;
  }

  bool validString(String data, {String err = "Data not valid"}) {
    if (data.isEmpty) {
      _showErrorSnack(err);
      return false;
    }
    return true;
  }

  ///-----------------------------------------------------------------------------
}
