import 'package:flutter/widgets.dart';
// import 'package:hello_wine_admin/login/login.dart';

import '../../app/app.dart';
import '../../home/home.dart';
import '../../login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];

    case AppStatus.unauthenticated:
      return [LoginPage.page()];
    default:
      return [HomePage.page()];
  }
}
