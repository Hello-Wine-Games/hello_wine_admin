import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
// import 'package:hello_wine_admin/home/_features/details/details.dart';
// import 'package:hello_wine_admin/home/_features/details/widgets/widgets.dart';
import 'package:hello_wine_admin/home/_features/features.dart';
import 'package:questions_repository/questions_repository.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    final _deetsCubit = context.read<DeetsCubit>();
    final _questionCubit = context.read<QuestionCubit>();

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Answer:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonType(
                    dropdownValue: question.type,
                    onChange: _deetsCubit.updateType,
                  ),
                  DropdownButtonPoints(
                    dropdownValue: question.points,
                    onChange: _deetsCubit.updatePoints,
                  ),
                ],
              ),
            ),
            BlocBuilder<DeetsCubit, DeetsState>(
              builder: (context, state) {
                switch (question.type) {
                  case 'True or False':
                    return TrueFalseAnswer(
                      key: Key(question.id!),
                      originalQuestion: _questionCubit.state.selectedQuestion,
                      question: question,
                      onChange: _deetsCubit.update,
                    );
                  case 'Multiple Choice':
                    return MultipleChoiceType(
                      key: Key(question.id!),
                      question: question,
                      originalQuestion: _questionCubit.state.selectedQuestion,
                      onChange: _deetsCubit.update,
                      onUpdated: (value) => _deetsCubit.updatedField(),
                    );

                  case 'Keyword':
                    return KeywordType(
                      key: Key(question.id!),
                      question: question,
                      originalQuestion: _questionCubit.state.selectedQuestion,
                      onChange: _deetsCubit.update,
                      onUpdated: (value) => _deetsCubit.updatedField(),
                    );
                  case 'Range':
                    return RangeType(
                      key: Key(question.id!),
                      question: question,
                      originalQuestion: _questionCubit.state.selectedQuestion,
                      onChange: _deetsCubit.update,
                      onUpdated: (value) => _deetsCubit.updatedField(),
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
