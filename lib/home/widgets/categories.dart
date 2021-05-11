import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({required this.categoriesChange});

  final Function(String) categoriesChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            categoriesChange('Everything But The Grape');
          },
          child: Text('Everything But The Grape'),
        ),
        ElevatedButton(
          onPressed: () {
            categoriesChange('Fortified Wine');
          },
          child: Text('Fortified Wine'),
        ),
        ElevatedButton(
          onPressed: () {
            categoriesChange('Geography');
          },
          child: Text('Geography'),
        ),
        ElevatedButton(
          onPressed: () {
            categoriesChange('Michigan Wine');
          },
          child: Text('Michigan Wine'),
        ),
      ],
    );
  }
}
