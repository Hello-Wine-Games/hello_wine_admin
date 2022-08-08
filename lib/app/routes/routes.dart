import 'package:flutter/widgets.dart';
import 'package:hello_wine_admin/app/app.dart';
import 'package:hello_wine_admin/home/home.dart';
import 'package:hello_wine_admin/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];

    case AppStatus.unauthenticated:
      return [LoginPage.page()];
    // default:
    //   return [HomePage.page()];
  }
}
