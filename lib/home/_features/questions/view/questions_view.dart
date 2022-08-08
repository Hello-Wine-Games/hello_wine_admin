import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/home/_features/categories/categories.dart';
import 'package:hello_wine_admin/home/_features/questions/question.dart';
import 'package:hello_wine_admin/home/_features/questions/widgets/widgets.dart';
import 'package:questions_repository/questions_repository.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                children: [
                  QuestionSummary(
                    title: context.read<CategoriesCubit>().state.category,
                  ),
                  const Center(child: Text('no content'))
                ],
              ),
            );
          // ignore: no_default_cases
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: [
          QuestionSummary(
            title: context.read<CategoriesCubit>().state.category,
          ),
          QuestionList(
            questions: questions,
          )
        ],
      ),
    );
  }
}
