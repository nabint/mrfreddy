class ErrorCodeException implements Exception {
  final int statusCode;
  final String message;

  ErrorCodeException(this.statusCode, this.message);

  @override
  String toString() => message;
}
