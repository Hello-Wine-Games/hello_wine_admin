// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_wine_admin/app/app.dart';
import 'package:questions_repository/questions_repository.dart';

void main() async {
  AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCpcdmfjOY7O9RmxeoD-e_weRyvyi-032U',
      appId: '1:936359464122:web:5fcb7fa60daad4af5c8683',
      messagingSenderId: '936359464122',
      projectId: 'hello-wine',
      authDomain: 'hello-wine.firebaseapp.com',
    ),
  );
  final authenticationRepository = AuthenticationRepository();
  final questionsRepository = FirebaseQuestionsRepository();
  await authenticationRepository.user.first;
  runZonedGuarded(
    () => runApp(
      App(
        questionsRepository: questionsRepository,
        authenticationRepository: authenticationRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
