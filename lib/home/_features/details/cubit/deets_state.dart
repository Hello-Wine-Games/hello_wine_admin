part of 'deets_cubit.dart';

enum DeetStatus { loading, success, updated, failure }

class DeetsState extends Equatable {
  const DeetsState._({
    this.status = DeetStatus.loading,
    this.question = const Question(
      question: 'New Question',
      type: 'Multiple Choice',
      points: 500,
      answers: [
        {'answer': 'answer 1', 'correct': true},
        {'answer': 'answer 2', 'correct': false},
      ],
    ),
  });
  const DeetsState.failure() : this._(status: DeetStatus.failure);

  const DeetsState.loading() : this._();

  const DeetsState.success(Question question)
      : this._(status: DeetStatus.success, question: question);

  final Question question;
  final DeetStatus status;

  @override
  List<Object> get props => [status, question];
}
