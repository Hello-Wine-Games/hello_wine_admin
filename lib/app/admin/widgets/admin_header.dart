import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/images.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';
import 'package:hello_wine_admin/UI/admin_button.dart';

class AdminHeader extends StatelessWidget {
  const AdminHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  HWImages.wineGlassIcon(),
                  Text(
                    'Admin',
                    style: HWTheme.lightTheme.textTheme.headline1
                        ?.copyWith(fontSize: 30),
                  ),
                ],
              ),
            ),
            const AdminButton(title: 'Logout'),
          ],
        ),
      ),
    );
  }
}
