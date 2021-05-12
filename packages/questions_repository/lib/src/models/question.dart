import '../entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Question extends Equatable {
  final String? id;
  final double? points;
  final String? question;
  // final List<Answer>? answers;
  final bool isDeleting;
  final bool isSelected;

  Question({
    String? id,
    required double? points,
    required String? question,
    // required List<Answer>? answers,
    this.isDeleting = false,
    this.isSelected = false,
  })  : this.id = id,
        this.points = points,
        this.question = question;
  // this.answers = answers;

  Question copyWith(
      {String? id,
      double? points,
      String? question,
      // List<Answer>? answers,
      bool? isDeleting,
      bool? isSelected}) {
    return Question(
      id: id ?? this.id,
      points: points ?? this.points,
      question: question ?? this.question,
      // answers: answers ?? this.answers,
      isDeleting: isDeleting ?? this.isDeleting,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  String toString() {
    return 'Question{id: $id, question: $question}';
  }

  QuestionEntity toEntity() {
    return QuestionEntity(id, points, question);
  }

  static Question fromEntity(QuestionEntity entity) {
    return Question(
      id: entity.id,
      points: entity.points,
      question: entity.question,
      // answers: entity.answers,
    );
  }

  @override
  List<Object?> get props => [id, points, question, isDeleting, isSelected];
}
