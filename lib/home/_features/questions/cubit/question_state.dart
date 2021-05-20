part of 'question_cubit.dart';

enum QuestionStatus {
  empty,
  loading,
  success,
  failure,
  updateCategory,
  newQuestion
}

class QuestionState extends Equatable {
  const QuestionState._({
    this.selectedQuestion = const Question(
      question: 'Default Question',
      type: 'Multiple Choice',
      points: 500,
      answers: [
        {'answer': 'answer 1', 'correct': true},
        {'answer': 'answer 2', 'correct': false},
      ],
    ),
    this.status = QuestionStatus.loading,
    this.questions = const <Question>[],
  });

  const QuestionState.loading() : this._();

  const QuestionState.newQuestion()
      : this._(status: QuestionStatus.newQuestion);

  const QuestionState.updating(
    List<Question> questions,
  ) : this._(
          questions: questions,
        );

  const QuestionState.empty() : this._(status: QuestionStatus.empty);

  const QuestionState.success(
      List<Question> questions, Question selectedQuestion)
      : this._(
          status: QuestionStatus.success,
          questions: questions,
          selectedQuestion: selectedQuestion,
        );

  const QuestionState.failure() : this._(status: QuestionStatus.failure);

  final QuestionStatus status;
  final List<Question> questions;
  final Question selectedQuestion;

  @override
  List<Object> get props => [status, questions, selectedQuestion];
}
