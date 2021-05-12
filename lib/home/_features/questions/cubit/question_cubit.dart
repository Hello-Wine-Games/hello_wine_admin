import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:questions_repository/questions_repository.dart';
import 'package:pedantic/pedantic.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit({required this.repository})
      : super(const QuestionState.loading());

  final QuestionsRepository repository;

  Future<void> fetchQuestions(String category) async {
    try {
      final questions = await repository.fetchQuestions(category);
      emit(QuestionState.success(questions, 0));
    } on Exception {
      emit(const QuestionState.failure());
    }
  }

  // Future<void> deleteItem(String id) async {
  //   final deleteInProgress = state.questions.map((question) {
  //     return question.id == id ? question.copyWith(isDeleting: true) : question;
  //   }).toList();

  //   emit(QuestionState.success(deleteInProgress));

  //   unawaited(repository.deleteQuestion(id).then((_) {
  //     final deleteSuccess = List.of(state.questions)
  //       ..removeWhere((element) => element.id == id);
  //     emit(QuestionState.success(deleteSuccess));
  //   }));
  // }

  Future<void> updateSelected(String id, int selected) async {
    final updateInProgress = state.questions.map((question) {
      return question.id == id
          ? question.copyWith(isSelected: true)
          : question.copyWith(isSelected: false);
    }).toList();
    emit(QuestionState.success(updateInProgress, selected));
  }
}
