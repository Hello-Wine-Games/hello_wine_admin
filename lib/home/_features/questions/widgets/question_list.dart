import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../question.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _QuestionTile(
            question: questions[index],
            isSelected:
                index == context.read<QuestionCubit>().state.selectedQuestion,
            onSelected: (id) {
              context.read<QuestionCubit>().updateSelected(id, index);
            },
            // onDeletePressed: (id) {
            //   context.read<QuestionCubit>().deleteItem(id);
            // },
          );
        },
        itemCount: questions.length,
      ),
    );
  }
}

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({
    Key? key,
    required this.question,
    required this.onSelected,
    required this.isSelected,
  }) : super(key: key);

  final Question question;
  final ValueSetter<String> onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? HWTheme.burgundy : HWTheme.grayOutline,
          width: isSelected ? 2.0 : 1.0,
        ),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          onSelected(question.id!);
        },
        leading: Text(
          question.points!.toString(),
          style: isSelected
              ? HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: HWTheme.burgundy)
              : HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: HWTheme.darkGray),
        ),
        selected: isSelected,
        title: Text(
          question.question!,
          style: TextStyle(
              color: isSelected ? HWTheme.burgundy : HWTheme.darkGray),
        ),
      ),
    );
  }
}
