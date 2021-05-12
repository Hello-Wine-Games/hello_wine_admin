import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';
import 'package:hello_wine_admin/app/admin/widgets/widgets.dart';

class AdminPage extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: AdminPage());

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AdminHeader(),
          const Divider(height: 1, color: HWTheme.grayOutline),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AdminMenu(),
                const AdminQuestions(),
                const AdminDetail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
