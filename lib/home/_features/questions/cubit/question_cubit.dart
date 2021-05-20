import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:questions_repository/questions_repository.dart';
import '../../categories/categories.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(
      {required this.repository, required CategoriesCubit categoriesCubit})
      : _categoriesCubit = categoriesCubit,
        super(const QuestionState.loading()) {
    _categoriesSubscription = categoriesCubit.stream.listen((state) {
      if (state.status == CategoryStatus.success) {
        print('success');
        fetchQuestions(state.category);
      }
    });
  }

  final CategoriesCubit _categoriesCubit;
  StreamSubscription? _categoriesSubscription;
  final QuestionsRepository repository;

  Future<void> fetchQuestions(String category) async {
    // If you really want to show a circular indicator, use this 👇🏼
    // emit(const QuestionState.loading());
    try {
      //calling the repo for the questions
      final questions = await repository.fetchQuestions(category);

      if (questions.isEmpty) {
        emit(const QuestionState.empty());
      } else {
        questions.sort((a, b) => <Comparator<Question>>[
              (o1, o2) => o2.points!.compareTo(o1.points!),
              (o1, o2) => o2.type!.compareTo(o1.type!),
              (o1, o2) => o1.question!.compareTo(o2.question!),
              // add more comparators here
            ].map((e) => e(a, b)).firstWhere((e) => e != 0, orElse: () => 0));

        emit(QuestionState.updating(questions));
        await updateSelected(questions[0].id!, 0);
      }
    } on Exception {
      emit(const QuestionState.failure());
    }
  }

  /// {@template updateSelected}
  /// This function updates the selected question by iterating
  /// through the list and setting the isSelected bool
  /// {@endtemplate}
  Future<void> updateSelected(String id, int selected) async {
    final updateInProgress = state.questions.map((question) {
      return question.id == id
          ? question.copyWith(isSelected: true)
          : question.copyWith(isSelected: false);
    }).toList();
    emit(QuestionState.success(updateInProgress, state.questions[selected]));
  }

  /// {@template addQuestion}
  /// This function calls the backend to add a new question
  /// and then calls fetchQuestions in order
  /// to refresh the list
  /// {@endtemplate}
  Future<void> addNewQuestion(Question question) async {
    await (repository
        .addNewQuestion(question, _categoriesCubit.state.category)
        .then((_) {
      fetchQuestions(_categoriesCubit.state.category);
    }));
  }

  /// {@template deleteQuestion}
  /// This function calls the backend to delete the question
  /// based on the ID and then calls fetchQuestions in order
  /// to refresh the list
  /// {@endtemplate}
  Future<void> deleteQuestion(String id) async {
    await (repository
        .deleteQuestion(id, _categoriesCubit.state.category)
        .then((_) {
      fetchQuestions(_categoriesCubit.state.category);
    }));
  }

  /// {@template updateQuestion}
  /// This function updates the question in the backend.
  /// Then, instead of calling fetchQuestions again,
  /// it copies the updated question back into the list
  /// and then reorders it based on points
  /// {@endtemplate}
  Future<void> updateQuestion(Question question) async {
    await (repository
        .updateQuestion(question, _categoriesCubit.state.category)
        .then((_) {
      final updatedList = state.questions.map((question2) {
        return question2.id == question.id
            ? question2.copyWith(
                points: question.points,
                question: question.question,
                answers: question.answers,
                type: question.type,
              )
            : question2.copyWith();
      }).toList()
        ..sort((a, b) => b.points!.compareTo(a.points!));

      emit(QuestionState.success(updatedList, question));
    }));
  }

  @override
  Future<void> close() {
    _categoriesSubscription?.cancel();
    return super.close();
  }
}
