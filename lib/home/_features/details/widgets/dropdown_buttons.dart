import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class DropDownButtons extends StatefulWidget {
  DropDownButtons({
    Key? key,
    required this.dropdownValue,
    required this.valueList,
    required this.bgColor,
    required this.isPoints,
  }) : super(key: key);

  final String dropdownValue;
  final List<String> valueList;
  final Color bgColor;
  final bool isPoints;

  @override
  _DropDownButtonsState createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
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
