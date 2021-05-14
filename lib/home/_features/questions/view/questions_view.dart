import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
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
            return const _QuestionView();
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questions = context.watch<QuestionCubit>().state.questions;

    return questions.isEmpty
        ? Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              children: [
                QuestionSummary(
                    title: context.read<QuestionCubit>().state.category),
                const Center(child: Text('no content'))
              ],
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              children: [
                QuestionSummary(
                    title: context.read<QuestionCubit>().state.category),
                QuestionList(
                  questions: context.read<QuestionCubit>().state.questions,
                )
              ],
            ),
          );
  }
}
