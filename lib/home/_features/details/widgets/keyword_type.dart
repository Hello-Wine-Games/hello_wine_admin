import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import 'create_textfield.dart';

class KeywordType extends StatefulWidget {
  const KeywordType(
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
  _KeywordTypeState createState() => _KeywordTypeState();
}

class _KeywordTypeState extends State<KeywordType> {
  late List<dynamic>? answers;
  bool _result = false;

  @override
  void initState() {
    loadAsyncData().then((result) {
      setState(() {
        _result = result;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !_result
        ? Container()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Keywords:',
                      style: HWTheme.lightTheme.textTheme.headline5
                          ?.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),

              ///====================================================================
              ///
              /// Displaying the answers
              ///
              ///====================================================================
              Container(
                height: 350,
                child: ListView.builder(
                  key: Key(widget.question.answers.toString()),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  key: Key(answers![index].hashCode.toString()),
                                  onChanged: (value) => widget.onUpdated(value),
                                  onSaved: (value) {
                                    setState(() {
                                      answers![index]['answer'] = value;
                                    });
                                  },
                                  initialValue: answers![index]['answer'],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: HWTheme.darkGray),
                                    ),
                                  ),
                                  style: HWTheme.lightTheme.textTheme.headline6
                                      ?.copyWith(
                                          fontSize: 16,
                                          color: HWTheme.darkGray),
                                ),
                              ),
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

  Future<bool> loadAsyncData() async {
    /// So, if the actual question type is indeed this type
    if (widget.originalQuestion.type == 'Keyword') {
      /// Then we set our value to the actual answer
      answers = widget.originalQuestion.answers!.map((e) => e).toList();
    } else {
      /// If not, then we set a default temp value
      answers = <dynamic>[
        {'answer': 'answer1', 'correct': true},
        {'answer': 'answer2', 'correct': true},
        {'answer': 'answer3', 'correct': true},
        {'answer': 'answer4', 'correct': true}
      ];

      /// and we prime our temporary question with this value
      /// in the case that we decide to hit the submit button
      widget.onChange(
        widget.question.copyWith(answers: answers),
      );
    }
    return true;
  }
}
