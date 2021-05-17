import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../widgets/widgets.dart';

class AnswerView extends StatelessWidget {
  AnswerView({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AnswerSettings(question: question),
          const MultipleChoiceType(),
          //const KeywordType(),
          //const TrueFalseType(),
          //RangeType(),
        ],
      ),
    );
  }
}

class AnswerSettings extends StatelessWidget {
  const AnswerSettings({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Expanded(
    //       child: DropDownButton(
    //         dropdownValue: question.type!,
    //         valueList: ['Multiple Choice', 'True or False', 'Keywords'],
    //         bgColor: HWTheme.burgundy,
    //         isPoints: false,
    //       ),
    //     ),
    //     Expanded(
    //       child: DropDownButton(
    //           dropdownValue: question.points!.toString(),
    //           valueList: ['500', '400', '300', '200', '100'],
    //           bgColor: HWTheme.darkGray,
    //           isPoints: true),
    //     ),
    //   ],
    // );
  }
}
