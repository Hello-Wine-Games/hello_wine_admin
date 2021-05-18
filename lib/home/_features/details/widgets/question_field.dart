import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';
import 'package:hello_wine_admin/home/_features/features.dart';
import 'package:questions_repository/questions_repository.dart';

class QuestionField extends StatefulWidget {
  QuestionField({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  _QuestionFieldState createState() => _QuestionFieldState();
}

class _QuestionFieldState extends State<QuestionField> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = widget.question.question!;

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
          controller: _controller,
          onTap: () => _controller.selection = TextSelection(
              baseOffset: 0, extentOffset: _controller.value.text.length),
          key: Key(widget.question.question!),
          // initialValue: widget.question.question!,
          validator: (val) {
            return val!.trim().isEmpty ? 'Please enter some text' : null;
          },
          onSaved: (value) {
            context.read<DeetsCubit>().updateQuestion(value);
          },
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

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}
