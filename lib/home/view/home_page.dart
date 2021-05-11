import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../_features/features.dart';
import '../home.dart';

class HomePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Categories(
              categoriesChange: (String category) =>
                  {context.read<QuestionCubit>().fetchQuestions(category)},
            ),
          ),
          Expanded(
            flex: 5,
            child: QuestionsView(),
          )
        ],
      ),
    );
  }
}