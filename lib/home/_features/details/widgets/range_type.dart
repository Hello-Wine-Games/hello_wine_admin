import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';

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
