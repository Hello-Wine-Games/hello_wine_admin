import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({required this.selectedQIndex});

  final int selectedQIndex;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(selectedQIndex.toString()));
  }
}
