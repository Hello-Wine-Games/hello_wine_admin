import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_repository/questions_repository.dart';

import '../question.dart';
import '../widgets/widgets.dart';

class QuestionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        switch (state.status) {
          case QuestionStatus.failure:
            return const Center(child: Text('Oops something went wrong!'));
          case QuestionStatus.success:
            return _QuestionView(
                questions: state.questions, category: state.category);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView(
      {Key? key, required this.questions, required this.category})
      : super(key: key);

  final List<Question> questions;
  final String category;

  @override
  Widget build(BuildContext context) {
    return questions.isEmpty
        ? Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              children: [
                const QuestionSummary(),
                const Center(child: Text('no content'))
              ],
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              children: [
                const QuestionSummary(),
                QuestionList(questions: questions, category: category),
              ],
            ),
          );
  }
}
