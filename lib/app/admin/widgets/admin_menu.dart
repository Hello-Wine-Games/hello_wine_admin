import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/images.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: HWTheme.burgundy,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Expanded(
            child: Column(
              children: [
                Expanded(
                  child: MenuButton(
                      icon: HWImages.barrelIcon(color: Colors.white),
                      isSelected: true,
                      onPressed: () {}),
                ),
                Expanded(
                  child: MenuButton(
                      icon: HWImages.grapesIcon(color: Colors.white),
                      isSelected: false,
                      onPressed: () {}),
                ),
                Expanded(
                  child: MenuButton(
                      icon: HWImages.corkIcon(color: Colors.white),
                      isSelected: false,
                      onPressed: () {}),
                ),
                Expanded(
                  child: MenuButton(
                      icon: HWImages.foodIcon(color: Colors.white),
                      isSelected: false,
                      onPressed: () {}),
                ),
                Expanded(
                  child: MenuButton(
                      icon: HWImages.globeIcon(color: Colors.white),
                      isSelected: false,
                      onPressed: () {}),
                ),
                Expanded(
                  child: MenuButton(
                      icon: HWImages.towerIcon(color: Colors.white),
                      isSelected: false,
                      onPressed: () {}),
                ),
                Expanded(
                  child: MenuButton(
                      icon: HWImages.questionIcon(color: Colors.white),
                      isSelected: false,
                      onPressed: () {}),
                ),
                Expanded(
                  child: MenuButton(
                      icon: HWImages.stateIcon(color: Colors.white),
                      isSelected: false,
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final bool isSelected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: () => {},
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
