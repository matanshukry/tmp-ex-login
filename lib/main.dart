import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:ex_login/app/app.dart';
import 'package:flutter/widgets.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final authRepository = AuthRepository();
      await authRepository.user.first;
      runApp(App(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}
