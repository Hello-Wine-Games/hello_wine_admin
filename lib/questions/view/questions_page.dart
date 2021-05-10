import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_repository/questions_repository.dart';
import '../question.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: QuestionsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex Question')),
      body: BlocBuilder<QuestionCubit, QuestionState>(
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
      ),
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

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({
    Key? key,
    required this.question,
    required this.onDeletePressed,
  }) : super(key: key);

  final Question question;
  final ValueSetter<String> onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('#${question.id}'),
      title: Text(question.question!),
      trailing: question.isDeleting
          ? const CircularProgressIndicator()
          : IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDeletePressed(question.id!),
            ),
    );
  }
}
