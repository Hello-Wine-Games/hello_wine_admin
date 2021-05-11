part of 'question_cubit.dart';

enum QuestionStatus { loading, success, failure, update }

class QuestionState extends Equatable {
  const QuestionState._({
    this.status = QuestionStatus.loading,
    this.questions = const <Question>[],
  });

  const QuestionState.loading() : this._();

  const QuestionState.success(List<Question> questions)
      : this._(status: QuestionStatus.success, questions: questions);

  const QuestionState.failure() : this._(status: QuestionStatus.failure);

  final QuestionStatus status;
  final List<Question> questions;

  @override
  List<Object> get props => [status, questions];
}
