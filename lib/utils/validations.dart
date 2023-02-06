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
        return 'Please enter password';
      } else if (value.length < 6) {
        return 'Please enter valid password';
      }
      return null;
    }
    return validatePassword;
  }
}
