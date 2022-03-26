part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.source,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  //
  final FormzStatus status;
  final String? errorMessage;
  final dynamic source;

  // Email/password credentials
  final Email email;
  final Password password;

  @override
  List<Object> get props => [status, email, password];

  LoginState copyWith({
    FormzStatus? status,
    String? errorMessage,
    dynamic source,
    Email? email,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      source: source ?? this.source,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}