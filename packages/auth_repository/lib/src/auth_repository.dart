import 'dart:async';

import 'package:auth_repository/src/failures/log_in_with_email_and_password_failure.dart';
import 'package:auth_repository/src/failures/log_out_failure.dart';
import 'package:auth_repository/src/failures/sign_up_with_email_and_password_failure.dart';
import 'package:auth_repository/src/models/user.dart';
import 'package:cache/cache.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:meta/meta.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthRepository {
  /// {@macro authentication_repository}
  AuthRepository({CacheClient? cache}) : _cache = cache ?? CacheClient();

  final CacheClient _cache;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return Stream.value(User.empty);
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp({required String email, required String password}) async {
    try {
      return Future.delayed(const Duration(seconds: 1));
      // await _firebaseAuth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return Future.delayed(const Duration(seconds: 1));
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        Future.delayed(const Duration(seconds: 2))
        // _firebaseAuth.signOut(),
        // _googleSignIn.signOut(),
      ]);
    } catch (e) {
      print(e);
      throw LogOutFailure(source: e);
    }
  }
}
