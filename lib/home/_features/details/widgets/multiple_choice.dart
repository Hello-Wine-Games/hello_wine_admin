import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class MultipleChoiceType extends StatelessWidget {
  const MultipleChoiceType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choices:',
                  style: HWTheme.lightTheme.textTheme.headline5
                      ?.copyWith(fontSize: 16),
                ),
                Text(
                  'Correct Answer:',
                  style: HWTheme.lightTheme.textTheme.headline5
                      ?.copyWith(fontSize: 16),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Text(
            label,
            style:
                HWTheme.lightTheme.textTheme.headline5?.copyWith(fontSize: 16),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Checkbox(value: isAnswer, onChanged: null),
          ),
        ],
      ),
    );
  }
}
