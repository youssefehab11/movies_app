sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;
  Success({required this.data});
}

class ServerError<T> extends Result<T> {
  bool success;
  int statusCode;
  String statusMessage;
  ServerError({
    required this.success,
    required this.statusMessage,
    required this.statusCode,
  });
}

class Error<T> extends Result<T> {
  Exception exception;
  Error({required this.exception});
}
