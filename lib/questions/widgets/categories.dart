import 'package:flutter/material.dart';
import 'package:hello_wine_admin/questions/question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key, required this.categoriesChange})
      : super(key: key);

  final Function(String) categoriesChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.blue; // Use the component's default.
                },
              ),
            ),
            onPressed: () {
              context.read<QuestionCubit>().fetchQuestions('Fortified Wine');
            },
            child: const Text(
              'Everything But The Grape',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.blue; // Use the component's default.
                },
              ),
            ),
            onPressed: () {
              categoriesChange('Fortified Wine');
            },
            child: const Text(
              'ElevatedButton with border side',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.blue; // Use the component's default.
                },
              ),
            ),
            onPressed: () {},
            child: const Text(
              'ElevatedButton with border side',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.blue; // Use the component's default.
                },
              ),
            ),
            onPressed: () {},
            child: const Text(
              'ElevatedButton with border side',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.blue; // Use the component's default.
                },
              ),
            ),
            onPressed: () {},
            child: const Text(
              'ElevatedButton with border side',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.blue; // Use the component's default.
                },
              ),
            ),
            onPressed: () {},
            child: const Text(
              'ElevatedButton with border side',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
