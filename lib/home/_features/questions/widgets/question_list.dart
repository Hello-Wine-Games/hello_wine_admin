import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../question.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final List<Question> questions;

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          var scroll = GlobalKey();
          return _QuestionTile(
            key: scroll,
            question: widget.questions[index],
            // isSelected: questions[index] ==
            //     context.read<QuestionCubit>().state.selectedQuestion,
            onSelected: (id) {
              Scrollable.ensureVisible(scroll.currentContext!,
                  alignment: 0.01, duration: const Duration(seconds: 1));
              context.read<QuestionCubit>().updateSelected(id, index);
            },
          );
        },
        itemCount: widget.questions.length,
      ),
    );
  }
}

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({
    Key? key,
    required this.question,
    required this.onSelected,
    // required this.isSelected,
  }) : super(key: key);

  final Question question;
  final ValueSetter<String> onSelected;
  // final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: question.isSelected ? HWTheme.burgundy : HWTheme.grayOutline,
          width: question.isSelected ? 2.0 : 1.0,
        ),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          onSelected(question.id!);
        },
        leading: Text(
          '${question.points!}',
          style: question.isSelected
              ? HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: HWTheme.burgundy)
              : HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: HWTheme.darkGray),
        ),
        selected: question.isSelected,
        title: Text.rich(
          TextSpan(
            text: '${question.type}: ',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: question.question!,
                style: TextStyle(
                    color: question.isSelected
                        ? HWTheme.burgundy
                        : HWTheme.darkGray),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
