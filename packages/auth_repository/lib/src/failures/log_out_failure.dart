/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {
  LogOutFailure({this.source});

  dynamic source;
}
