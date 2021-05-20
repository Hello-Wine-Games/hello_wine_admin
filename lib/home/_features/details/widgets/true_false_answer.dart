import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

class TrueFalseAnswer extends StatefulWidget {
  TrueFalseAnswer({
    Key? key,
    required this.question,
    required this.originalQuestion,
    required this.onChange,
  }) : super(key: key);

  final Question question;
  final Question originalQuestion;
  final ValueSetter<Question> onChange;

  @override
  _TrueFalseAnswerState createState() => _TrueFalseAnswerState();
}

class _TrueFalseAnswerState extends State<TrueFalseAnswer> {
  late List<dynamic>? answers;

  /// What's goin on here is pretty confusing at first
  ///
  /// Thing is.. We need a temporary state for the
  /// dropdown t/f box.
  /// This is separate from the temporary question
  /// (which is floated in DeetsState)

  @override
  void initState() {
    print('onInit');

    /// So, if the actual question type is indeed this type
    if (widget.originalQuestion.type == 'True or False') {
      print('In Yes');

      /// Then we set our value to the actual answer
      answers = widget.originalQuestion.answers!;
    } else {
      /// If not, then we set a default temp value
      answers = <dynamic>[
        {'answer': 'False', 'correct': false},
      ];

      /// and we prime our temporary question with this value
      /// in the case that we decide to hit the submit button
      widget.onChange(
        widget.question.copyWith(
          answers: <dynamic>[
            {'answer': 'False', 'correct': false},
          ],
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'The answer is:',
            style:
                HWTheme.lightTheme.textTheme.headline5?.copyWith(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HWTheme.grayOutline,
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: widget.question.answers![0]['answer'],
                    icon: const Icon(
                      FontAwesomeIcons.caretDown,
                      color: Colors.grey,
                      size: 32,
                    ),
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(color: Colors.grey, fontSize: 16),
                    onChanged: (String? newValue) {
                      /// So here we set our temporary state for the widget
                      setState(
                        () {
                          widget.onChange(
                              widget.question.copyWith(answers: answers));
                        },
                      );

                      /// and here we prime our temporary question in the
                      /// case we decide to hit submit
                      widget
                          .onChange(widget.question.copyWith(answers: <dynamic>[
                        {'answer': newValue.toString(), 'correct': newValue},
                      ]));
                    },
                    items: ['True', 'False']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
