import 'package:form_field_validator/form_field_validator.dart';

class PhoneValidation extends TextFieldValidator {
  PhoneValidation({String errorText = 'enter a valid phone number'})
      : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    return hasMatch(r'(^(?:[+0]9)?[0-9]{10,12}$)', value ?? '');
  }
}

class ConfirmationPassword extends TextFieldValidator {
  ConfirmationPassword(
      {String errorText = 'Password does not match', required this.password})
      : super(errorText);

  String password;

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    return value == password;
  }
}
