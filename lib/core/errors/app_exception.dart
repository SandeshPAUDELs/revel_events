class AppException implements Exception{
  final String? message;
  final String _prefix;

  AppException([this.message, this._prefix = "Error"]);
  @override
  String toString() {
    return '$_prefix: ${message ?? ""}';
  }
}
class InternetException extends AppException {
  InternetException([String? message])
      : super(message, "No Internet Connection");
}
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}