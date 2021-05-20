import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:hello_wine_admin/home/_features/questions/cubit/question_cubit.dart';
import 'package:questions_repository/questions_repository.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: HWTheme.grayOutline,
            ),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Questions (${context.read<QuestionCubit>().state.questions.length})',
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(fontSize: 20, color: HWTheme.darkGray),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      var question2 = const Question(
                        question: 'An Awesome Question',
                        type: 'True or False',
                        points: 500,
                        answers: [
                          {'answer': 'True', 'correct': true},
                        ],
                      );
                      context.read<QuestionCubit>().addNewQuestion(
                            question2,
                          );
                    },
                    elevation: 2.0,
                    fillColor: HWTheme.burgundy,
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
