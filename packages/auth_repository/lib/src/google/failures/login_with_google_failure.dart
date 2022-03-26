/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
/// {@endtemplate}
class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure(
    this.code, {
    this.message = 'An unknown exception occurred.',
    this.source,
  });

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code, {dynamic source}) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message: 'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message: 'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message: 'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message:
              'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message: 'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message: 'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message: 'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return LogInWithGoogleFailure(
          code,
          source: source,
          message: 'The credential verification ID received is invalid.',
        );
      default:
        return LogInWithGoogleFailure(code, source: source);
    }
  }

  /// The associated error message.
  final String message;

  /// The associated error code.
  final String code;

  /// The associated error code.
  final dynamic source;

  @override
  String toString() => '{ LogInWithGoogleFailure: $message / $code / $source }';
}
