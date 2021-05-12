import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_repository/questions_repository.dart';

import '../question.dart';

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
    return questions.isEmpty
        ? const Center(child: Text('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _QuestionTile(
                index: index,
                question: questions[index],
                onSelected: (id) {
                  context.read<QuestionCubit>().updateSelected(id, index);
                },
                // onDeletePressed: (id) {
                //   context.read<QuestionCubit>().deleteItem(id);
                // },
              );
            },
            itemCount: questions.length,
          );
  }
}

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({
    Key? key,
    required this.index,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  final Question question;
  final ValueSetter<String> onSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onSelected(question.id!);
      },
      selected: index == context.read<QuestionCubit>().state.selectedQuestion,
      title: Text(question.question!),
    );
  }
}
