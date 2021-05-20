import 'package:flutter/widgets.dart';
// import 'package:hello_wine_admin/login/login.dart';

import '../../app/app.dart';
import '../../home/home.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
    // return [LoginPage.page()];
    case AppStatus.unauthenticated:
    default:
      return [HomePage.page()];
  }
}
