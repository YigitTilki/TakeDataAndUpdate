import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:take_data_and_update_project/product/base/base_validators.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';

class Validators extends BaseValidators {
  @override
  String? eMail({required String? value, required String emailController}) {
    final email = emailController;
    final isValid = EmailValidator.validate(email);
    if (email.isNotEmpty) {
      if (isValid) {
        return null;
      } else {
        return LocaleKeys.validatorErrors_invalidEmail.tr();
      }
    } else {
      return LocaleKeys.validatorErrors_requiredForm.tr();
    }
  }

  @override
  String? firstName({required String? value}) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return LocaleKeys.validatorErrors_requiredForm.tr();
    }
  }

  @override
  String? lastName({required String? value}) {
    if (value!.isNotEmpty && value.length >= 2) {
      return null;
    } else {
      return LocaleKeys.validatorErrors_requiredForm.tr();
    }
  }

  @override
  String? password({required String? value}) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validatorErrors_requiredForm.tr();
    }

    if (value.length < 8) {
      return LocaleKeys.validatorErrors_passwordMust8.tr();
    }

    if (!value.contains(RegExp('[A-Z]'))) {
      return LocaleKeys.validatorErrors_passwordMustUpperCase.tr();
    }

    if (!value.contains(RegExp('[a-z]'))) {
      return LocaleKeys.validatorErrors_passwordMustLowerCase.tr();
    }

    if (!value.contains(RegExp('[0-9]'))) {
      return LocaleKeys.validatorErrors_passwordMustOneDigit.tr();
    }
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return LocaleKeys.validatorErrors_passwordMustContainOneSpecialCharacter
          .tr();
    }

    return null;
  }

  @override
  String? rePassword({
    required String? value,
    required String passwordController,
  }) {
    if (value != passwordController) {
      return LocaleKeys.validatorErrors_passwordDoesntMatch.tr();
    } else {
      return null;
    }
  }

  @override
  String? loginEMail({
    required String? value,
    required String emailController,
  }) {
    final email = emailController;
    final isValid = EmailValidator.validate(email);
    if (isValid) {
      return null;
    } else {
      return LocaleKeys.validatorErrors_invalidEmailPassword.tr();
    }
  }

  @override
  String? loginPassword({required String? value}) {
    if (value!.isNotEmpty && value.length >= 8) {
      return null;
    } else {
      return LocaleKeys.validatorErrors_invalidEmailPassword.tr();
    }
  }
}
