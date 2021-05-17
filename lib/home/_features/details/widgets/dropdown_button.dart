import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class DropDownButton extends StatefulWidget {
  DropDownButton({
    Key? key,
    required this.notifyParent,
    required this.dropdownValue,
    required this.valueList,
    required this.bgColor,
    required this.isPoints,
  }) : super(key: key);

  String dropdownValue;
  final List<String> valueList;
  final Color bgColor;
  final bool isPoints;
  final Function(String something) notifyParent;

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    // var valueList = widget.valueList;
    // var dropdownValue = widget.dropdownValue;
    // var bgColor = widget.bgColor;
    // var isPoints = widget.isPoints;
    return Padding(
      padding: widget.isPoints
          ? const EdgeInsets.fromLTRB(20, 16, 0, 16)
          : const EdgeInsets.fromLTRB(0, 16, 20, 16),
      child: Container(
        height: 40,
        color: widget.bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: widget.bgColor,
              value: widget.dropdownValue,
              icon: const Icon(
                FontAwesomeIcons.caretDown,
                color: Colors.white,
                size: 32,
              ),
              style: HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: Colors.white, fontSize: 16),
              onChanged: (String? newValue) {
                setState(() {
                  widget.dropdownValue = newValue!;
                  widget.notifyParent(newValue);
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
