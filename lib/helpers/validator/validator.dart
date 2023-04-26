import 'package:form_field_validator/form_field_validator.dart';

import 'custom.dart';

class Validator {
  static final requiredValidator = RequiredValidator(
    errorText: "This field is required",
  );

  static final emailValidator = MultiValidator([
    RequiredValidator(
      errorText: "This field email is required",
    ),
    EmailValidator(
      errorText: 'Your email is invalid. Please check again your email',
    )
  ]);

  static final usernameValidator = MultiValidator([
    RequiredValidator(
      errorText: "This field username is required",
    ),
    PatternValidator(r'^[a-z A-Z]+$',
        errorText: 'Username must only alphabetical letter')
  ]);

  static final passwordValidator = RequiredValidator(
    errorText: 'The field password is required',
  );

  static final insertPasswordValidator = MultiValidator([
    passwordValidator,
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
  ]);

  static final createPasswordValidator = MultiValidator([
    requiredValidator,
    MinLengthValidator(6, errorText: 'password must be at least 8 digits long'),
  ]);

  static final phoneValidation = MultiValidator([
    PhoneValidation(),
    requiredValidator,
  ]);
  static final insertDescValidator = MultiValidator([
    passwordValidator,
    MinLengthValidator(16,
        errorText: 'description must be at least 16 characters'),
  ]);
}
