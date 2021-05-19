import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class DropdownButtonPoints extends StatelessWidget {
  DropdownButtonPoints({
    Key? key,
    required this.dropdownValue,
    required this.onChange,
  }) : super(key: key);

  final double? dropdownValue;
  final ValueSetter<double> onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      color: HWTheme.darkGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            dropdownColor: HWTheme.darkGray,
            value: dropdownValue!.toInt(),
            icon: const Icon(
              FontAwesomeIcons.caretDown,
              color: Colors.white,
              size: 32,
            ),
            style: HWTheme.lightTheme.textTheme.headline5
                ?.copyWith(color: Colors.white, fontSize: 16),
            onChanged: (int? newValue) {
              onChange(newValue!.toDouble());
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
    );
  }
}
