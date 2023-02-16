import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validations {
  late BuildContext context;
  late AppLocalizations appLocalization;

  Validations(context) {
    appLocalization = AppLocalizations.of(context)!;
  }

  getPhoneValidation() {
    validatePhone(value) {
      if (value == null || value.isEmpty) {
        return appLocalization.enter_mobile;
      } else if (value.length < 10) {
        return appLocalization.enter_valid_mobile;
      }
      return null;
    }

    return validatePhone;
  }

  getPasswordValidation() {
    validatePassword(value) {
      if (value == null || value.isEmpty) {
        return appLocalization.enter_password;
      } else if (value.length < 6) {
        return appLocalization.enter_valid_password;
      }
      return null;
    }

    return validatePassword;
  }

  getEmailValidation() {
    validateEmail(value) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);

      if (value == null || value.isEmpty) {
        return appLocalization.enter_email;
      } else if (!emailValid) {
        return appLocalization.enter_valid_email;
      }
      return null;
    }
    return validateEmail;
  }

  getNameValidation() {
    validateEmail(value) {

      if (value == null || value.isEmpty) {
        return appLocalization.enter_name;
      }
      return null;
    }
    return validateEmail;
  }
}
