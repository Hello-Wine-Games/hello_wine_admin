import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_wine_admin/home/_features/questions/question.dart';
import 'package:hello_wine_admin/home/home.dart';
import 'package:questions_repository/questions_repository.dart';

part 'deets_state.dart';

class DeetsCubit extends Cubit<DeetsState> {
  DeetsCubit({required QuestionCubit questionCubit})
      : _questionCubit = questionCubit,
        super(const DeetsState.loading()) {
    _questionSubscription = questionCubit.stream.listen((state) {
      if (state.status == QuestionStatus.success) {
        emit(DeetsState.success(state.selectedQuestion));
      } else {
        emit(const DeetsState.loading());
      }
    });
  }

  final QuestionCubit _questionCubit;
  StreamSubscription? _questionSubscription;

  @override
  Future<void> close() {
    _questionSubscription?.cancel();
    return super.close();
  }

  Future<void> reload() async {
    emit(DeetsState.success(state.question));
  }

  Future<void> update(Question question) async {
    emit(DeetsState.updated(question));
  }

  /// This is to bypass updating the entire state
  /// when I just want to set off the alarm that
  /// a field has been changed

  Future<void> updatedField() async {
    emit(DeetsState.updatedField(state.question));
  }

  Future<void> updateQuestion(String? question) async {
    final output = state.question.copyWith(question: question);
    emit(DeetsState.updated(output));
  }

  Future<void> updatePoints(double points) async {
    final output = state.question.copyWith(points: points);
    emit(DeetsState.updated(output));
  }

  Future<void> updateType(String? type) async {
    final output = state.question.copyWith(type: type);
    emit(DeetsState.updated(output));
  }

  Future<void> updateAnswer(List<dynamic>? answers) async {
    final output = state.question.copyWith(answers: answers);
    emit(DeetsState.updated(output));
  }
}
