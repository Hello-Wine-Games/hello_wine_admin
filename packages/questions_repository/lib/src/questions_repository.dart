// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.
library questions_repository;

import 'dart:async';

import 'package:questions_repository/questions_repository.dart';
import 'package:questions_repository/src/models/question.dart';

abstract class QuestionsRepository {
  Future<void> addNewQuestion(Question question, String category);

  Future<void> deleteQuestion(String id, String category);

  Future<List<Question>> fetchQuestions(String category);

  Future<void> updateQuestion(Question question, String category);

  Future<bool> getCategories(String category);
}
