import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';
import 'package:hello_wine_admin/UI/admin_button.dart';

class AdminDetail extends StatefulWidget {
  const AdminDetail({
    Key? key,
  }) : super(key: key);

  @override
  _AdminDetailState createState() => _AdminDetailState();
}

class _AdminDetailState extends State<AdminDetail> {
  String dropdownValue = 'Multiple Choice';
  String dropdownPoints = '500';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        color: HWTheme.background,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 24, 16),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: HWTheme.grayOutline,
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Question:',
                      style: HWTheme.lightTheme.textTheme.headline5
                          ?.copyWith(fontSize: 20),
                    ),
                  ),
                  Expanded(
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
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: QuestionSetting(
                            dropdownValue: dropdownValue,
                            valueList: [
                              'Multiple Choice',
                              'True or False',
                              'Keywords'
                            ],
                            bgColor: HWTheme.burgundy,
                            isPoints: false,
                          ),
                        ),
                        Expanded(
                          child: QuestionSetting(
                              dropdownValue: dropdownPoints,
                              valueList: ['500', '400', '300', '200', '100'],
                              bgColor: HWTheme.darkGray,
                              isPoints: true),
                        ),
                      ],
                    ),
                  ),
                  //MultipleChoiceSection(),
                  //KeywordSection(),
                  //TrueFalseType(),
                  RangeType(),
                  const BottomActions()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

class KeywordType extends StatelessWidget {
  const KeywordType({
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
                    'Keywords:',
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const CreateKeyword(
            label: 'A:',
          ),
          const CreateKeyword(
            label: 'B:',
          ),
          const CreateKeyword(
            label: 'C:',
          ),
          const CreateKeyword(
            label: 'D:',
          ),
        ],
      ),
    );
  }
}

class TrueFalseType extends StatelessWidget {
  const TrueFalseType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'The answer is:',
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          TrueFalseDropdown(
            dropdownValue: 'True',
            valueList: ['True', 'False'],
          ),
        ],
      ),
    );
  }
}

class CreateKeyword extends StatelessWidget {
  const CreateKeyword({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

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
            Expanded(
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
          ],
        ),
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
            Expanded(
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
            Expanded(
              child: Checkbox(value: isAnswer, onChanged: null),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeType extends StatefulWidget {
  @override
  _RangeTypeState createState() => _RangeTypeState();
}

class _RangeTypeState extends State<RangeType> {
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
                  child: Text(
                    'The answer is between:',
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const CreateKeyword(
            label: 'First Number:',
          ),
          const CreateKeyword(
            label: 'Second Number:',
          ),
        ],
      ),
    );
  }
}

class TrueFalseDropdown extends StatefulWidget {
  TrueFalseDropdown({
    Key? key,
    required this.dropdownValue,
    required this.valueList,
  }) : super(key: key);

  String dropdownValue;
  List<String> valueList;

  @override
  _TrueFalseDropdownState createState() => _TrueFalseDropdownState();
}

class _TrueFalseDropdownState extends State<TrueFalseDropdown> {
  @override
  Widget build(BuildContext context) {
    var valueList = widget.valueList;
    var dropdownValue = widget.dropdownValue;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 20, 16),
      child: Expanded(
        child: Container(
          height: 50,
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
                  size: 40,
                ),
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(color: Colors.grey, fontSize: 20),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: valueList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionSetting extends StatefulWidget {
  QuestionSetting({
    Key? key,
    required this.dropdownValue,
    required this.valueList,
    required this.bgColor,
    required this.isPoints,
  }) : super(key: key);

  String dropdownValue;
  List<String> valueList;
  Color bgColor;
  bool isPoints;

  @override
  _QuestionSettingState createState() => _QuestionSettingState();
}

class _QuestionSettingState extends State<QuestionSetting> {
  @override
  Widget build(BuildContext context) {
    var valueList = widget.valueList;
    var dropdownValue = widget.dropdownValue;
    var bgColor = widget.bgColor;
    var isPoints = widget.isPoints;
    return Padding(
      padding: isPoints
          ? const EdgeInsets.fromLTRB(20, 16, 0, 16)
          : const EdgeInsets.fromLTRB(0, 16, 20, 16),
      child: Expanded(
        child: Container(
          height: 50,
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: bgColor,
                value: widget.dropdownValue,
                icon: const Icon(
                  FontAwesomeIcons.caretDown,
                  color: Colors.white,
                  size: 40,
                ),
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(color: Colors.white, fontSize: 20),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: valueList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomActions extends StatelessWidget {
  const BottomActions({
    Key? key,
  }) : super(key: key);

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
              onPressed: () {},
            ),
            const AdminButton(title: 'Submit'),
          ],
        ),
      ),
    );
  }
}
