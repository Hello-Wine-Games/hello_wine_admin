import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

class TrueFalseType extends StatefulWidget {
  const TrueFalseType(
      {Key? key, required this.question, required this.notifyParentAnswer})
      : super(key: key);

  final Question question;
  final Function(List<dynamic> something) notifyParentAnswer;

  @override
  _TrueFalseTypeState createState() => _TrueFalseTypeState();
}

class _TrueFalseTypeState extends State<TrueFalseType> {
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
        TrueFalseDropdown(
          notifyParentAnswer: widget.notifyParentAnswer,
          dropdownValue: widget.question.type! == 'True or False'
              ? widget.question.answers![0]['answer']
              : 'False',
          valueList: ['True', 'False'],
        ),
      ],
    );
  }
}

class TrueFalseDropdown extends StatefulWidget {
  TrueFalseDropdown(
      {Key? key,
      required this.dropdownValue,
      required this.valueList,
      required this.notifyParentAnswer})
      : super(key: key);

  String dropdownValue;
  List<String> valueList;
  final Function(List<dynamic> something) notifyParentAnswer;

  @override
  _TrueFalseDropdownState createState() => _TrueFalseDropdownState();
}

class _TrueFalseDropdownState extends State<TrueFalseDropdown> {
  @override
  void initState() {
    widget.notifyParentAnswer(<dynamic>[
      {'answer': 'False', 'correct': true},
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              value: widget.dropdownValue,
              icon: const Icon(
                FontAwesomeIcons.caretDown,
                color: Colors.grey,
                size: 32,
              ),
              style: HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: Colors.grey, fontSize: 16),
              onChanged: (String? newValue) {
                setState(() {
                  widget.dropdownValue = newValue!;
                  widget.notifyParentAnswer(<dynamic>[
                    {'answer': newValue, 'correct': true},
                  ]);
                });
              },
              items: widget.valueList
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
    );
  }
}
