import 'package:flutter/material.dart';

import 'package:hello_wine_admin/UI/HWTheme.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => <String, dynamic>{},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(HWTheme.darkBurgundy),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(10),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: HWTheme.darkBurgundy),
          ),
        ),
      ),
      child: Text(
        title,
        style: HWTheme.lightTheme.textTheme.headline6
            ?.copyWith(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
