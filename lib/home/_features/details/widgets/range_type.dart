import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

class RangeType extends StatefulWidget {
  const RangeType(
      {Key? key,
      required this.question,
      required this.originalQuestion,
      required this.onChange,
      required this.onUpdated})
      : super(key: key);

  final Question question;
  final Question originalQuestion;
  final ValueSetter<Question> onChange;
  final ValueSetter<String?> onUpdated;
  @override
  _RangeTypeState createState() => _RangeTypeState();
}

class _RangeTypeState extends State<RangeType> {
  late List<dynamic>? answers;

  /// What's goin on here is pretty confusing at first
  ///
  /// Thing is.. We need a temporary state for the
  /// TextFields
  /// This is separate from the temporary question
  /// (which is floated in DeetsState)

  @override
  void initState() {
    print('init');

    /// So, if the actual question type is indeed this type
    if (widget.originalQuestion.type == 'Range') {
      /// Then we set our value to the actual answer
      answers = widget.originalQuestion.answers!.map((e) => e).toList();
    } else {
      /// If not, then we set a default temp value
      answers = <dynamic>[
        {'answer': '0', 'correct': true},
        {'answer': '1', 'correct': true},
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
                'The answer is between:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Text(
                'Lower Bound:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 16),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          key: Key(answers![0].hashCode.toString()),
                          onChanged: (value) => widget.onUpdated(value),
                          onSaved: (value) {
                            setState(() {
                              answers![0]['answer'] = value;
                            });
                          },
                          initialValue: answers![0]['answer'],
                          validator: (val) {
                            return val!.trim().isEmpty
                                ? 'Please enter a number'
                                : null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: HWTheme.darkGray),
                            ),
                          ),
                          style: HWTheme.lightTheme.textTheme.headline6
                              ?.copyWith(fontSize: 16, color: HWTheme.darkGray),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Text(
                'Upper Bound:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 16),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          key: Key(answers![1].hashCode.toString()),
                          onChanged: (value) => widget.onUpdated(value),
                          onSaved: (value) {
                            setState(() {
                              answers![1]['answer'] = value;
                            });
                          },
                          initialValue: answers![1]['answer'],
                          validator: (val) {
                            return val!.trim().isEmpty
                                ? 'Please enter a number'
                                : null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: HWTheme.darkGray),
                            ),
                          ),
                          style: HWTheme.lightTheme.textTheme.headline6
                              ?.copyWith(fontSize: 16, color: HWTheme.darkGray),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
