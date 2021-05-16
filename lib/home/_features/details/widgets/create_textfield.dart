import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';

class CreateTextField extends StatelessWidget {
  const CreateTextField({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Text(
            label,
            style:
                HWTheme.lightTheme.textTheme.headline5?.copyWith(fontSize: 20),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    height: 50,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: HWTheme.darkGray),
                        ),
                      ),
                      style: HWTheme.lightTheme.textTheme.headline6
                          ?.copyWith(fontSize: 20, color: HWTheme.darkGray),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
