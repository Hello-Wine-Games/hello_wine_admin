import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import 'create_textfield.dart';

class KeywordType extends StatefulWidget {
  const KeywordType({Key? key, required this.question, required this.onChange})
      : super(key: key);

  final Question question;
  final ValueSetter<List<dynamic>?> onChange;

  @override
  _KeywordTypeState createState() => _KeywordTypeState();
}

class _KeywordTypeState extends State<KeywordType> {
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
    if (true) {
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
      // context.read<DeetsCubit>().update(
      //       widget.question.copyWith(answers: answers),
      //     );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Keywords:',
              style: HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(fontSize: 20),
            ),
          ],
        ),

        ///====================================================================
        ///
        /// Displaying the answers
        ///
        ///====================================================================
        ListView.builder(
          key: Key(widget.question.answers.toString()),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Text(
                    (index + 1).toString(),
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
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HWTheme.darkGray),
                                ),
                              ),
                              style: HWTheme.lightTheme.textTheme.headline6
                                  ?.copyWith(
                                      fontSize: 20, color: HWTheme.darkGray),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 4,
        ),
        const CreateTextField(
          label: 'A:',
        ),
        const CreateTextField(
          label: 'B:',
        ),
        const CreateTextField(
          label: 'C:',
        ),
        const CreateTextField(
          label: 'D:',
        ),
      ],
    );
  }
}
