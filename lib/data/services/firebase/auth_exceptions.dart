enum AuthExceptions {
  weakPassword('weak-password'),
  emailAlreadyExists('email-already-in-use');

  const AuthExceptions(this.value);
  final String value;
}
