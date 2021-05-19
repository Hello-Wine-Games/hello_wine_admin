import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import 'create_textfield.dart';

class KeywordType extends StatelessWidget {
  const KeywordType({Key? key, required this.question, required this.onChange})
      : super(key: key);

  final Question question;
  final ValueSetter<List<dynamic>?> onChange;

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
