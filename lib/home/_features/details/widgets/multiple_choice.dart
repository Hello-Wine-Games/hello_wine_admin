import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class MultipleChoiceType extends StatelessWidget {
  const MultipleChoiceType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'Choices:',
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Correct Answer:',
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const CreateChoice(
            isAnswer: false,
            label: 'A:',
          ),
          const CreateChoice(
            isAnswer: false,
            label: 'B:',
          ),
          const CreateChoice(
            isAnswer: false,
            label: 'C:',
          ),
          const CreateChoice(
            isAnswer: false,
            label: 'D:',
          ),
        ],
      ),
    );
  }
}

class CreateChoice extends StatelessWidget {
  const CreateChoice({
    Key? key,
    required this.label,
    required this.isAnswer,
  }) : super(key: key);

  final String label;
  final bool isAnswer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Text(
              label,
              style: HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(fontSize: 20),
            ),
            SizedBox(width: 12),
            Container(
              height: 25,
              child: Expanded(
                flex: 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: HWTheme.darkGray),
                    ),
                  ),
                  style: HWTheme.lightTheme.textTheme.headline6
                      ?.copyWith(fontSize: 20, color: HWTheme.darkGray),
                ),
              ),
            ),
            Expanded(
              child: Checkbox(value: isAnswer, onChanged: null),
            ),
          ],
        ),
      ),
    );
  }
}
