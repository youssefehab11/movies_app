abstract class Validator {
  String fieldName;
  Validator({
    required this.fieldName,
  });

  String? validate(String? input) {
    if (input == null || input.trim().isEmpty) {
      return '$fieldName can\'t be empty';
    }
    return null;
  }
}

class NameValidaror extends Validator {
  NameValidaror({
    required super.fieldName,
  });
}

class PhoneValidator extends Validator {
  PhoneValidator({
    required super.fieldName,
  });
}

class EmailValidator extends Validator {
  final String fieldErrorMessage;
  EmailValidator({
    required super.fieldName,
    required this.fieldErrorMessage,
  });
  @override
  String? validate(String? input) {
    String? result = super.validate(input);
    if (result != null) return result;
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input!);
    if (!emailValid) {
      return fieldErrorMessage;
    }
    return null;
  }
}

class PasswordValidator extends Validator {
  final String fieldErrorMessage;
  PasswordValidator({
    required super.fieldName,
    required this.fieldErrorMessage,
  });
  @override
  String? validate(String? input) {
    String? result = super.validate(input);
    if (result != null) return result;
    if (input!.length < 6) {
      return fieldErrorMessage;
    }
    return null;
  }
}

class RePasswordValidator extends Validator {
  final String fieldErrorMessage;
  String password;
  RePasswordValidator({
    required super.fieldName,
    required this.fieldErrorMessage,
    required this.password,
  });
  @override
  String? validate(String? input) {
    String? result = super.validate(input);
    if (result != null) return result;
    if (password != input) {
      return fieldErrorMessage;
    }
    return null;
  }
}
