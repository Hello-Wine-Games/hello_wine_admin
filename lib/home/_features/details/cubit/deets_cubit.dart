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
        print('deets success');
        emit(DeetsState.success(state.selectedQuestion));
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
}
