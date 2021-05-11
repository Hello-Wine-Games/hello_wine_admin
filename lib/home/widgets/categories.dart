import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({required this.categoriesChange});

  final Function(String) categoriesChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                categoriesChange('Everything But The Grape');
              },
              child: Text('Everything But The Grape'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                categoriesChange('Everything But The Grape');
              },
              child: Text('Everything But The Grape'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                categoriesChange('Everything But The Grape');
              },
              child: Text('Everything But The Grape'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                categoriesChange('Everything But The Grape');
              },
              child: Text('Everything But The Grape'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                categoriesChange('Fortified Wine');
              },
              child: Text('Fortified Wine'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                categoriesChange('Geography');
              },
              child: Text('Geography'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                categoriesChange('Michigan Wine');
              },
              child: Text('Michigan Wine'),
            ),
          ),
        ),
      ],
    );
  }
}
