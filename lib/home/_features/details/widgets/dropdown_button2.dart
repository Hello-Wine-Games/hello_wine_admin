import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class DropDownButton2 extends StatefulWidget {
  DropDownButton2({
    Key? key,
    required this.notifyParent,
    required this.dropdownValue,
    required this.valueList,
    required this.bgColor,
  }) : super(key: key);

  int dropdownValue;
  final List<int> valueList;
  final Color bgColor;
  final Function(int something) notifyParent;

  @override
  _DropDownButton2State createState() => _DropDownButton2State();
}

class _DropDownButton2State extends State<DropDownButton2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Container(
        height: 40,
        width: 200,
        color: HWTheme.darkGray,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              dropdownColor: HWTheme.darkGray,
              value: widget.dropdownValue.toInt(),
              icon: const Icon(
                FontAwesomeIcons.caretDown,
                color: Colors.white,
                size: 32,
              ),
              style: HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: Colors.white, fontSize: 16),
              onChanged: (int? newValue) {
                setState(() {
                  widget.dropdownValue = newValue!;
                  widget.notifyParent(newValue);
                });
              },
              items: [500, 400, 300, 200, 100]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
