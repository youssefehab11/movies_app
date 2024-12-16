enum FirebaseCodes {
  weakPassword('weak-password'),
  emailAlreadyExists('email-already-in-use'),
  invalidCredintials('invalid-credential');

  const FirebaseCodes(this.value);
  final String value;
}

class AuthExceptionsMessages {
  static const weakPassword = 'The password provided is too weak.';
  static const emailAlreadyExists =
      'The account already exists for that email.';
  static const wrongEmailOrPassword = 'Wrong Email or Password.';
}
