import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../details.dart';

import '../../questions/question.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        switch (state.status) {
          case QuestionStatus.failure:
            return const Center(child: Text('Oops something went wrong!'));
          case QuestionStatus.success:
            return _DetailsView(
              question: state.questions[state.selectedQuestion],
              onDeletePressed: (id) {
                context.read<QuestionCubit>().deleteQuestion(
                    id, context.read<QuestionCubit>().state.category);
              },
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _DetailsView extends StatefulWidget {
  const _DetailsView({
    Key? key,
    required this.question,
    required this.onDeletePressed,
  }) : super(key: key);

  final Question question;
  final ValueSetter<String> onDeletePressed;

  @override
  __DetailsViewState createState() => __DetailsViewState();
}

class __DetailsViewState extends State<_DetailsView> {
  String dropdownValue = 'Multiple Choice';
  String dropdownPoints = '500';

  String _question = 'question';
  int _points = 0;
  String _type = 'type';
  List<dynamic> _answer = [
    {'answer': 'answer', 'correct': true}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HWTheme.background,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 24, 16),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: HWTheme.grayOutline,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                QuestionForm(
                    initialValue: widget.question.question,
                    question: _question),
                // QuestionDropdownButtons(
                //     type: widget.question.type, dropdownPoints: dropdownPoints),
                //MultipleChoiceSection(),
                //KeywordSection(),
                //TrueFalseType(),
                RangeType(),
                const BottomActions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _DetailsView extends StatelessWidget {
//   const _DetailsView({
//     Key? key,
//     required this.question,
//     required this.onDeletePressed,
//   }) : super(key: key);

//   final Question question;
//   final ValueSetter<String> onDeletePressed;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(question.question!),
//         Text(question.points!.toString()),
//         Text(question.type!),
//         IconButton(
//           icon: const Icon(Icons.delete, color: Colors.red),
//           onPressed: () => onDeletePressed(question.id!),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemBuilder: (BuildContext context, int index) {
//               return Row(
//                 children: [
//                   Text(question.answers![index]['answer']),
//                   Text(question.answers![index]['correct'].toString()),
//                 ],
//               );
//             },
//             itemCount: question.answers!.length,
//           ),
//         )
//       ],
//     );
//   }
// }
