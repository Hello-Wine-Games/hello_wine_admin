import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Answer extends Equatable {
  final String? answer;
  final bool? correct;

  Answer({required String? answer, required bool? correct})
      : this.answer = answer,
        this.correct = correct;

  Answer copyWith({String? answer, bool? correct}) {
    return Answer(
      answer: answer ?? this.answer,
      correct: correct ?? this.correct,
    );
  }

  @override
  String toString() {
    return 'Answer{answer: $answer, correct: $correct}';
  }

  AnswerEntity toEntity() {
    return AnswerEntity(answer, correct);
  }

  static Answer fromEntity(AnswerEntity entity) {
    return Answer(answer: entity.answer, correct: entity.correct);
  }

  @override
  List<Object?> get props => [answer, correct];
}
