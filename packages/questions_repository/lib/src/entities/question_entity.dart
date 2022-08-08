library questions_repository;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String? id;
  final double? points;
  final String? question;
  final String? type;
  final List<dynamic>? answers;

  const QuestionEntity(
      this.id, this.points, this.question, this.type, this.answers);

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'points': points,
      'type': type,
      'question': question,
      'answers': answers,
    };
  }

  @override
  List<Object?> get props => [id, points, question, type, answers];

  @override
  String toString() {
    return 'QuestionEntity { id: $id, points: $points, question: $question, type: $type, answers: $answers';
  }

  static QuestionEntity fromJson(Map<String, Object> json) {
    return QuestionEntity(
      json['id'] as String,
      json['points'] as double,
      json['question'] as String,
      json['type'] as String,
      json['answers'] as List<dynamic>,
    );
  }

  static QuestionEntity fromSnapshot(QueryDocumentSnapshot? snap) {
    return QuestionEntity(
      snap?.id,
      snap?.get('points'),
      snap?.get('question'),
      snap?.get('type'),
      snap?.get('answers'),
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'points': points,
      'question': question,
      'type': type,
      'answers': answers,
    };
  }
}
