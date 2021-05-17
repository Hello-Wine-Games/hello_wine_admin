import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features.dart';

class BottomActions extends StatelessWidget {
  const BottomActions({
    Key? key,
    required this.onDeletePressed,
  }) : super(key: key);

  final ValueSetter<String> onDeletePressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                FontAwesomeIcons.solidTrashAlt,
                color: HWTheme.burgundy,
                size: 40,
              ),
              onPressed: () {
                context.read<QuestionCubit>().deleteQuestion(
                    context.read<QuestionCubit>().state.selectedQuestion.id!);
              },
            ),
            const AdminButton(title: 'Submit'),
          ],
        ),
      ),
    );
  }
}
