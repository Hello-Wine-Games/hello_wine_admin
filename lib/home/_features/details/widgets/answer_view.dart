import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';
import '../../features.dart';
import '../details.dart';
import './widgets.dart';

class AnswerView extends StatelessWidget {
  AnswerView({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Answer:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonType(
                    dropdownValue: question.type,
                    onChange: (value) {
                      context.read<DeetsCubit>().updateType(value);
                    },
                  ),
                  DropdownButtonPoints(
                    dropdownValue: question.points,
                    onChange: (value) {
                      context.read<DeetsCubit>().updatePoints(value);
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<DeetsCubit, DeetsState>(
              builder: (context, state) {
                switch (question.type) {
                  case 'Multiple Choice':
                    return MultipleChoiceType(
                      key: Key(question.id!),
                      question: question,
                      onChange: (value) {
                        context.read<DeetsCubit>().updateAnswer(value);
                      },
                      onUpdated: (value) =>
                          context.read<DeetsCubit>().updatedField(),
                    );
                  case 'True or False':
                    return TrueFalseAnswer(
                      key: Key(question.id!),
                      question: question,
                      onChange: (value) {
                        context.read<DeetsCubit>().updateAnswer(value);
                      },
                    );
                  case 'Keyword':
                    return KeywordType(
                      key: Key(question.id!),
                      question: question,
                      onChange: (value) {
                        context.read<DeetsCubit>().updateAnswer(value);
                      },
                    );
                  default:
                    return const Text('default');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
