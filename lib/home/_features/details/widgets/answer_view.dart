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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropDownButton(
                dropdownValue: question.type!,
                valueList: ['Multiple Choice', 'True or False', 'Keywords'],
                bgColor: HWTheme.burgundy,
                isPoints: false,
              ),
              DropDownButton(
                  dropdownValue: question.points!.toString(),
                  valueList: ['500', '400', '300', '200', '100'],
                  bgColor: HWTheme.darkGray,
                  isPoints: true),
            ],
          ),
          // const MultipleChoiceType(),
        ],
      ),
    );
  }
}
