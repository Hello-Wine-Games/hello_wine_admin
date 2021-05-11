// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:questions_repository/questions_repository.dart';

abstract class QuestionsRepository {
  Future<void> addNewQuestion(Question Question);

  Future<void> deleteQuestion(String id);

  Future<List<Question>> fetchQuestions(String category);

  Future<void> updateQuestion(Question question);
}
