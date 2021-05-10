// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_wine_admin/app/app.dart';
import 'package:hello_wine_admin/app/bloc_observer.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:questions_repository/questions_repository.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  final questionsRepository = FirebaseQuestionsRepository();
  await authenticationRepository.user.first;
  runZonedGuarded(
    () => runApp(App(
      questionsRepository: questionsRepository,
      authenticationRepository: authenticationRepository,
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
