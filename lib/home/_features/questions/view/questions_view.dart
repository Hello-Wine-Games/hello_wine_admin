import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_repository/questions_repository.dart';

import '../question.dart';

class QuestionsView extends StatelessWidget {
  QuestionsView({required this.selectedQIndex});

  final int selectedQIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          switch (state.status) {
            case QuestionStatus.failure:
              return const Center(child: Text('Oops something went wrong!'));
            case QuestionStatus.success:
              return _QuestionView(
                questions: state.questions,
                selectedQIndex: selectedQIndex,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView(
      {Key? key, required this.questions, required this.selectedQIndex})
      : super(key: key);

  final List<Question> questions;
  final int selectedQIndex;

  @override
  Widget build(BuildContext context) {
    return questions.isEmpty
        ? const Center(child: Text('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _QuestionTile(
                index: index,
                selectedQIndex: selectedQIndex,
                question: questions[index],
                onDeletePressed: (id) {
                  context.read<QuestionCubit>().deleteItem(id);
                },
              );
            },
            itemCount: questions.length,
          );
  }
}

class _QuestionTile extends StatefulWidget {
  _QuestionTile(
      {Key? key,
      required this.question,
      required this.onDeletePressed,
      required this.index,
      required this.selectedQIndex})
      : super(key: key);

  final Question question;
  final ValueSetter<String> onDeletePressed;
  int selectedQIndex;
  final int index;

  @override
  __QuestionTileState createState() => __QuestionTileState();
}

class __QuestionTileState extends State<_QuestionTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: widget.index == widget.selectedQIndex,
      title: Text(widget.question.question!),
      onTap: () {
        setState(() {
          widget.selectedQIndex = widget.index;
        });
      },
    );
  }
}
