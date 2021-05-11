// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:questions_repository/questions_repository.dart';
import 'entities/entities.dart';

class FirebaseQuestionsRepository implements QuestionsRepository {
  final questionsCollection =
      FirebaseFirestore.instance.collection('questions');

  @override
  Future<void> addNewQuestion(Question question) {
    return questionsCollection.add(question.toEntity().toDocument());
  }

  @override
  Future<void> deleteQuestion(String id) async {
    return questionsCollection.doc(id).delete();
  }

  @override
  Future<List<Question>> fetchQuestions(String category) {
    print('fetching $category');
    return FirebaseFirestore.instance
        .collection('categories')
        .doc(category)
        .collection('questions')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Question.fromEntity(QuestionEntity.fromSnapshot(doc)))
          .toList();
    }).first;
  }

  @override
  Future<void> updateQuestion(Question update) {
    return questionsCollection
        .doc(update.id)
        .update(update.toEntity().toDocument());
  }
}
