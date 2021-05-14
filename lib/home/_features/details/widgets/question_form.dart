import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';

class QuestionForm extends StatelessWidget {
  QuestionForm({
    Key? key,
    required this.initialValue,
    required this.question,
  }) : super(key: key);

  final String? initialValue;
  String question; //cant be set as final because is setter

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Question:',
            style:
                HWTheme.lightTheme.textTheme.headline5?.copyWith(fontSize: 20),
          ),
        ),
        TextFormField(
          initialValue: initialValue,
          validator: (val) {
            return val!.trim().isEmpty ? 'Please enter some text' : null;
          },
          onSaved: (value) => question = value ?? 'Unknown',
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: HWTheme.darkGray),
            ),
          ),
          style: HWTheme.lightTheme.textTheme.headline6
              ?.copyWith(fontSize: 20, color: HWTheme.darkGray),
        ),
      ],
    );
  }
}