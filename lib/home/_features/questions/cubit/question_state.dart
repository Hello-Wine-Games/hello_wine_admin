part of 'question_cubit.dart';

enum QuestionStatus { loading, success, failure, update }

class QuestionState extends Equatable {
  const QuestionState._({
    this.selectedQuestion = 0,
    this.category = 'Winemaking Process',
    this.status = QuestionStatus.loading,
    this.questions = const <Question>[],
  });

  const QuestionState.loading() : this._();

  const QuestionState.success(
      List<Question> questions, int selectedQuestion, String category)
      : this._(
            status: QuestionStatus.success,
            questions: questions,
            selectedQuestion: selectedQuestion,
            category: category);

  const QuestionState.failure() : this._(status: QuestionStatus.failure);

  final QuestionStatus status;
  final List<Question> questions;
  final int selectedQuestion;
  final String category;

  @override
  List<Object> get props => [status, questions, selectedQuestion, category];
}
