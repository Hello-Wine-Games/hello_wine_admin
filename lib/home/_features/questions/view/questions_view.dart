import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_repository/questions_repository.dart';

import '../../categories/categories.dart';
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
            return _QuestionView(questions: state.questions);
          case QuestionStatus.empty:
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Column(
                children: [
                  QuestionSummary(
                      title: context.read<CategoriesCubit>().state.category),
                  const Center(child: Text('no content'))
                ],
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView({Key? key, required this.questions}) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        children: [
          QuestionSummary(
              title: context.read<CategoriesCubit>().state.category),
          QuestionList(
            questions: questions,
          )
        ],
      ),
    );
  }
}
