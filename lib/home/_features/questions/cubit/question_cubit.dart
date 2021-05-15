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
      emit(QuestionState.success(questions, 0, category));
    } on Exception {
      emit(const QuestionState.failure());
    }
  }

  Future<void> addNewQuestion(Question question) async {
    await (repository.addNewQuestion(question, state.category).then((_) {
      fetchQuestions(state.category);
    }));
  }

  Future<void> deleteQuestion(String id) async {
    await (repository.deleteQuestion(id, state.category).then((_) {
      final deleteSuccess = List.of(state.questions)
        ..removeWhere((element) => element.id == id);
      emit(QuestionState.success(deleteSuccess, 0, state.category));
    }));
  }

  Future<void> updateSelected(String id, int selected) async {
    final updateInProgress = state.questions.map((question) {
      return question.id == id
          ? question.copyWith(isSelected: true)
          : question.copyWith(isSelected: false);
    }).toList();
    emit(QuestionState.success(updateInProgress, selected, state.category));
  }

  Future<void> updateAnswer(Question question) async {
    await (repository.updateQuestion(question, state.category).then((_) {
      fetchQuestions(state.category);
    }));
  }
}
