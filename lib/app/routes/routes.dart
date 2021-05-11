import 'package:flutter/widgets.dart';
import '../../app/app.dart';
import '../../home/home.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
    case AppStatus.unauthenticated:
    default:
      return [HomePage.page()];
  }
}
