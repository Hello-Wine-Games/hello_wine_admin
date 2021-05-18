import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

class TrueFalseAnswer extends StatefulWidget {
  TrueFalseAnswer({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  _TrueFalseAnswerState createState() => _TrueFalseAnswerState();
}

class _TrueFalseAnswerState extends State<TrueFalseAnswer> {
  late String dropdownValue;

  @override
  void initState() {
    if (widget.question.type == 'True or False') {
      dropdownValue = widget.question.answers![0]['answer'];
    } else {
      dropdownValue = 'False';

      widget.question.copyWith(
        answers: <dynamic>[
          {'answer': 'False', 'correct': true},
        ],
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'The answer is:',
          style: HWTheme.lightTheme.textTheme.headline5?.copyWith(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 20, 16),
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: HWTheme.grayOutline,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: dropdownValue,
                  icon: const Icon(
                    FontAwesomeIcons.caretDown,
                    color: Colors.grey,
                    size: 32,
                  ),
                  style: HWTheme.lightTheme.textTheme.headline5
                      ?.copyWith(color: Colors.grey, fontSize: 16),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      // widget.notifyParentAnswer(<dynamic>[
                      //   {'answer': newValue, 'correct': true},
                      // ]);
                    });
                  },
                  items: ['True', 'False']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
