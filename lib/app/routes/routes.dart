import 'package:flutter/widgets.dart';
import 'package:ex_login/app/bloc/app_bloc.dart';
import 'package:ex_login/home/view/home_page.dart';
import 'package:ex_login/login/view/login_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
