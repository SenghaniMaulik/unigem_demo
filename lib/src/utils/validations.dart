import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validations {
  late BuildContext context;
  late AppLocalizations appLocalization;

  Validations(context) {
    appLocalization = AppLocalizations.of(context)!;
  }

  getPhoneValidation({bool isRequired = true}) {
    validatePhone(value) {
      print(
          "getPhoneValidation =$isRequired ${value == null || value.isEmpty}");
      if (isRequired && value.isEmpty) {
        return appLocalization.enter_mobile;
      } else if (!value.isEmpty && value.length < 10) {
        return appLocalization.enter_valid_mobile;
      }
      return null;
    }
    return validatePhone;
  }

  getNumberValidation(
      {bool isRequired = true, int length = 5, required String field}) {
    validateNumber(value) {
      if (isRequired &&  value.isEmpty) {
        return appLocalization.please_enter_(field.toLowerCase());
      } else if (!value.isEmpty &&  value.length > length) {
        return appLocalization.please_enter_valid_(field.toLowerCase());
      }
      return null;
    }

    return validateNumber;
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

  getEmailValidation({bool isRequired = true}) {
    validateEmail(value) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);

      if (isRequired && value.isEmpty) {
        return appLocalization.enter_email;
      } else if (isRequired && !value.isEmpty && !emailValid) {
        return appLocalization.enter_valid_email;
      }
      return null;
    }

    return validateEmail;
  }

  getNameValidation({bool isRequired = true, required String field}) {
    validateName(value) {
      if (isRequired &&  value.isEmpty) {
        return appLocalization.please_enter_(field.toLowerCase());
      }
      return null;
    }

    return validateName;
  }

  getGeneralValidation({bool isRequired = true, required String field}) {
    validateGeneral(value) {
      if (isRequired && value==null || value.isEmpty) {
        return appLocalization.please_enter_(field.toLowerCase());
      }
      return null;
    }

    return validateGeneral;
  }
}
