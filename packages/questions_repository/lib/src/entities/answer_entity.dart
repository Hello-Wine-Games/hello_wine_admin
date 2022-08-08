import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable {
  final String? answer;
  final bool? correct;

  const AnswerEntity(this.answer, this.correct);

  Map<String, Object?> toJson() {
    return {
      'answer': answer,
      'correct': correct,
    };
  }

  @override
  List<Object?> get props => [answer, correct];

  @override
  String toString() {
    return 'AnswerEntity { answer: $answer, correct $correct';
  }

  static AnswerEntity fromJson(Map<String, Object> json) {
    return AnswerEntity(
      json['answer'] as String,
      json['correct'] as bool,
    );
  }

  static AnswerEntity fromSnapshot(DocumentSnapshot? snap) {
    return AnswerEntity(
      snap?.get('answer'),
      snap?.get('correct'),
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'answer': answer,
      'correct': correct,
    };
  }
}
