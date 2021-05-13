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
                // Todo: separate question widget==============================
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Question:',
                    style: HWTheme.lightTheme.textTheme.headline5
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                TextFormField(
                  initialValue: widget.question.question,
                  validator: (val) {
                    return val!.trim().isEmpty
                        ? 'Please enter some text'
                        : null;
                  },
                  onSaved: (value) => _question = value!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: HWTheme.darkGray),
                    ),
                  ),
                  style: HWTheme.lightTheme.textTheme.headline6
                      ?.copyWith(fontSize: 20, color: HWTheme.darkGray),
                ),
                // Todo: separate dropdown widget==============================
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: QuestionSetting(
                          dropdownValue: widget.question.type!,
                          valueList: [
                            'Multiple Choice',
                            'True or False',
                            'Keywords'
                          ],
                          bgColor: HWTheme.burgundy,
                          isPoints: false,
                        ),
                      ),
                      Expanded(
                        child: QuestionSetting(
                            dropdownValue: dropdownPoints,
                            valueList: ['500', '400', '300', '200', '100'],
                            bgColor: HWTheme.darkGray,
                            isPoints: true),
                      ),
                    ],
                  ),
                ),
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
