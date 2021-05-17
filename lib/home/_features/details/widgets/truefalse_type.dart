import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class TrueFalseType extends StatelessWidget {
  const TrueFalseType({
    Key? key,
  }) : super(key: key);

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
          dropdownValue: 'True',
          valueList: ['True', 'False'],
        ),
      ],
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
    );
  }
}
