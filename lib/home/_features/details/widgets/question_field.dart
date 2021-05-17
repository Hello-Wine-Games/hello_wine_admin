import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';
import 'package:hello_wine_admin/home/_features/features.dart';
import 'package:questions_repository/questions_repository.dart';

class QuestionField extends StatelessWidget {
  QuestionField({
    Key? key,
    required this.question,
    required this.tempQuestion,
    required this.onSubmitPressed,
  }) : super(key: key);

  final String question;
  String tempQuestion;
  final ValueSetter<String> onSubmitPressed;

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
          key: Key(question),
          initialValue: question,
          validator: (val) {
            return val!.trim().isEmpty ? 'Please enter some text' : null;
          },
          onSaved: (value) => tempQuestion = value ?? 'Unknown',
          decoration: const InputDecoration(
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
