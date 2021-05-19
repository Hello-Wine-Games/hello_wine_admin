import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../../features.dart';

class MultipleChoiceType extends StatefulWidget {
  const MultipleChoiceType(
      {Key? key,
      required this.question,
      required this.onChange,
      required this.onUpdated})
      : super(key: key);

  final Question question;
  final ValueSetter<Question> onChange;
  final ValueSetter<String?> onUpdated;

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
        'Multiple Choice') {
      /// Then we set our value to the actual answer
      answers = widget.question.answers!.map((e) => e).toList();
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
      // widget.question.copyWith(answers: answers);
      widget.onChange(
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
            key: Key(widget.question.answers.toString()),
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
                              key: Key(answers![index].hashCode.toString()),
                              onChanged: (value) => widget.onUpdated(value),
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
                        key: Key(answers![index].hashCode.toString()),
                        value: widget.question.answers![index]['correct'],
                        onChanged: (newValue) {
                          answers![index] = {
                            'answer': answers![index]['answer'],
                            'correct': newValue
                          };

                          setState(() {});
                          widget.onChange(
                              widget.question.copyWith(answers: answers));
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
