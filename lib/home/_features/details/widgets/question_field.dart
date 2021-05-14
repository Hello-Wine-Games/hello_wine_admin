import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';
import 'package:questions_repository/questions_repository.dart';

class QuestionField extends StatelessWidget {
  QuestionField({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question; //cant be set as final because is setter

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
          initialValue: question.question,
          validator: (val) {
            return val!.trim().isEmpty ? 'Please enter some text' : null;
          },
          // onSaved: (value) => question = value ?? 'Unknown',
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
