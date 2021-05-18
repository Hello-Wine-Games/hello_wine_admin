import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';

import '../details.dart';

class DropdownButtonType extends StatefulWidget {
  DropdownButtonType({
    Key? key,
    required this.dropdownValue,
    required this.onChange,
  }) : super(key: key);

  final String? dropdownValue;
  final ValueSetter<String> onChange;

  @override
  _DropdownButtonTypeState createState() => _DropdownButtonTypeState();
}

class _DropdownButtonTypeState extends State<DropdownButtonType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      color: HWTheme.burgundy,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: HWTheme.burgundy,
            value: widget.dropdownValue,
            icon: const Icon(
              FontAwesomeIcons.caretDown,
              color: Colors.white,
              size: 32,
            ),
            style: HWTheme.lightTheme.textTheme.headline5
                ?.copyWith(color: Colors.white, fontSize: 16),
            onChanged: (String? newValue) {
              context.read<DeetsCubit>().updateType(newValue);
            },
            items: ['Multiple Choice', 'True or False', 'Keyword']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
