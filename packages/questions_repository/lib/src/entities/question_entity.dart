import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String? id;
  final double? points;
  final String? question;
  // final List<Answer> answers;

  const QuestionEntity(this.id, this.points, this.question);

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'points': points,
      'question': question,
      // 'answers': answers,
    };
  }

  @override
  List<Object?> get props => [
        id,
        points,
        question,
      ];

  @override
  String toString() {
    return 'QuestionEntity { id: $id, points: $points, question: $question,';
  }

  static QuestionEntity fromJson(Map<String, Object> json) {
    return QuestionEntity(
      json['id'] as String,
      json['points'] as double,
      json['question'] as String,
      // json['answers'] as List<Answer>,
    );
  }

  static QuestionEntity fromSnapshot(DocumentSnapshot? snap) {
    return QuestionEntity(
      snap?.id,
      snap?.data()?['points'],
      snap?.data()?['question'],
      // snap?.data()?['answers'],
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'points': points,
      'question': question,
      // 'answers': answers,
    };
  }
}

class Answer {
  final String? answer;
  final bool? correct;

  const Answer(this.answer, this.correct);
}
