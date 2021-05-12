import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../_features/features.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: HomePage());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedQIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Categories(
              categoriesChange: (String category) =>
                  {context.read<QuestionCubit>().fetchQuestions(category)},
            ),
          ),
          Expanded(
            flex: 3,
            child: QuestionsView(
              selectedQIndex: selectedQIndex,
            ),
          ),
          Expanded(
            flex: 7,
            child: Details(
              selectedQIndex: selectedQIndex,
            ),
          )
        ],
      ),
    );
  }
}
