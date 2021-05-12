import 'package:flutter/material.dart';
import '../../../../UI/ui.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(HWTheme.darkBurgundy),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: isSelected
                    ? const BorderSide(color: Colors.white, width: 2)
                    : const BorderSide(color: HWTheme.darkBurgundy)),
          ),
        ),
        child: icon,
      ),
    );
  }
}
