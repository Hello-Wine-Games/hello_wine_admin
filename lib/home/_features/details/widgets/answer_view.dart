import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';
import '../details.dart';
import './widgets.dart';

class AnswerView extends StatefulWidget {
  AnswerView({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  _AnswerViewState createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonType(
                  dropdownValue: widget.question.type,
                  onChange: (value) {
                    context.read<DeetsCubit>().updateType(value);
                  },
                ),
                DropdownButtonPoints(
                  dropdownValue: widget.question.points,
                  onChange: (value) {
                    context.read<DeetsCubit>().updatePoints(value);
                  },
                ),
              ],
            ),

            ///======================================
            //   ValueListenableBuilder(
            //     builder: (BuildContext context, String type, Widget? child) {
            //       // This builder will only get called when the _counter
            //       // is updated.
            //       switch (type) {
            //         case ('Multiple Choice'):
            //           return MultipleChoiceType(
            //             question: widget.question,
            //             notifyParentAnswer: widget.notifyParentAnswer,
            //           );
            //         case ('True or False'):
            //           return TrueFalseAnswer(
            //             question: widget.question,
            //           );
            //         case ('Keyword'):
            //           return const KeywordType();
            //         default:
            //           return const Text('default');
            //       }

            //       // return Column(
            //       //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       //   children: <Widget>[
            //       //     Text('$type'),
            //       //     child!,
            //       //   ],
            //       // );
            //     },
            //     valueListenable: _type,
            //     // The child parameter is most helpful if the child is
            //     // expensive to build and does not depend on the value from
            //     // the notifier.
            //     child: Container(
            //       height: 100,
            //       child: ListView.builder(
            //         itemBuilder: (BuildContext context, int index) {
            //           return Row(
            //             children: [
            //               Text(widget.question.answers![index]['answer']),
            //               Text(widget.question.answers![index]['correct']
            //                   .toString()),
            //             ],
            //           );
            //         },
            //         itemCount: widget.question.answers!.length,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
