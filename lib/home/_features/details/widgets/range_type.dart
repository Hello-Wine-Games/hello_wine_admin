import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:hello_wine_admin/home/home.dart';

class RangeType extends StatefulWidget {
  @override
  _RangeTypeState createState() => _RangeTypeState();
}

class _RangeTypeState extends State<RangeType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'The answer is between:',
              style: HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(fontSize: 20),
            ),
          ],
        ),
        const CreateTextField(
          label: 'First Number:',
        ),
        const CreateTextField(
          label: 'Second Number:',
        ),
      ],
    );
  }
}
