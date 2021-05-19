import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../../features.dart';

class MultipleChoiceType extends StatefulWidget {
  const MultipleChoiceType(
      {Key? key, required this.question, required this.onChange})
      : super(key: key);

  final Question question;
  final ValueSetter<List<dynamic>?> onChange;

  @override
  _MultipleChoiceTypeState createState() => _MultipleChoiceTypeState();
}

class _MultipleChoiceTypeState extends State<MultipleChoiceType> {
  late List<dynamic>? answers;

  /// What's goin on here is pretty confusing at first
  ///
  /// Thing is.. We need a temporary state for the
  /// TextFields
  /// This is separate from the temporary question
  /// (which is floated in DeetsState)

  @override
  void initState() {
    /// So, if the actual question type is indeed this type
    if (context.read<QuestionCubit>().state.selectedQuestion.type ==
        widget.question.type) {
      /// Then we set our value to the actual answer
      answers = context.read<QuestionCubit>().state.selectedQuestion.answers!;
    } else {
      /// If not, then we set a default temp value
      answers = <dynamic>[
        {'answer': 'answer1', 'correct': true},
        {'answer': 'answer2', 'correct': false},
        {'answer': 'answer3', 'correct': false},
        {'answer': 'answer4', 'correct': false}
      ];

      /// and we prime our temporary question with this value
      /// in the case that we decide to hit the submit button
      widget.question.copyWith(answers: answers);
      context.read<DeetsCubit>().update(
            widget.question.copyWith(answers: answers),
          );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choices:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 16),
              ),
              Text(
                'Correct Answer:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          height: 350,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${index + 1}: ',
                          style: HWTheme.lightTheme.textTheme.headline5
                              ?.copyWith(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            height: 50,
                            width: 500,
                            child: TextFormField(
                              onSaved: (value) {
                                setState(() {
                                  answers![index]['answer'] = value;
                                });
                              },
                              initialValue: answers![index]['answer'],
                              validator: (val) {
                                return val!.trim().isEmpty
                                    ? 'Please enter some text'
                                    : null;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HWTheme.darkGray),
                                ),
                              ),
                              style: HWTheme.lightTheme.textTheme.headline6
                                  ?.copyWith(
                                      fontSize: 16, color: HWTheme.darkGray),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Checkbox(
                        value: answers![index]['correct'],
                        onChanged: (newValue) {
                          setState(() {
                            answers![index]['correct'] = newValue;
                          });

                          widget.onChange(answers);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
