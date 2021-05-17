import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../widgets/widgets.dart';

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
              // dropdownPoints:
              //     state.questions[state.selectedQuestion].points.toString(),
              // dropdownType: state.questions[state.selectedQuestion].type!,
              question: state.questions.isEmpty
                  ? const Question(
                      question: 'New Question',
                      type: 'Multiple Choice',
                      points: 500,
                      answers: [
                        {'answer': 'answer 1', 'correct': true},
                        {'answer': 'answer 2', 'correct': false},
                      ],
                    )
                  : state.selectedQuestion,

              onDeletePressed: (id) {
                context.read<QuestionCubit>().deleteQuestion(id);
              },
            );
          case QuestionStatus.empty:
            return const Center(child: Text('no content'));
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
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _dropdownType = 'Multiple Choice';
  String _dropdownPoints = '500';
  String tempQuestion = 'question';
  // int _points = 0;
  // String _type = 'type';
  // List<dynamic> _answer = [
  //   {'answer': 'answer', 'correct': true}
  // ];

  @override
  Widget build(BuildContext context) {
    // _dropdownValue = widget.question.type!;
    // _dropdownPoints = widget.question.points.toString();
    // Question tempQuestion = widget.question;

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
            child: Form(
              key: _formKey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //========================question============================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Question:',
                          style: HWTheme.lightTheme.textTheme.headline5
                              ?.copyWith(fontSize: 20),
                        ),
                      ),
                      TextFormField(
                        key: Key(widget.question.question!),
                        initialValue: widget.question.question,
                        validator: (val) {
                          return val!.trim().isEmpty
                              ? 'Please enter some text'
                              : null;
                        },
                        onSaved: (value) => tempQuestion = value ?? 'Unknown',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: HWTheme.darkGray),
                          ),
                        ),
                        style: HWTheme.lightTheme.textTheme.headline6
                            ?.copyWith(fontSize: 16, color: HWTheme.darkGray),
                      ),
                    ],
                  ),
                  //========================dropdowns===========================
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.fromLTRB(0, 16, 20, 16),
                  //       child: Container(
                  //         height: 40,
                  //         color: HWTheme.burgundy,
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 12.0),
                  //           child: DropdownButtonHideUnderline(
                  //             child: DropdownButton<String>(
                  //               dropdownColor: HWTheme.burgundy,
                  //               value: _dropdownType,
                  //               icon: const Icon(
                  //                 FontAwesomeIcons.caretDown,
                  //                 color: Colors.white,
                  //                 size: 32,
                  //               ),
                  //               style: HWTheme
                  //                   .lightTheme.textTheme.headline5
                  //                   ?.copyWith(
                  //                       color: Colors.white,
                  //                       fontSize: 16),
                  //               onChanged: (String? newValue) {
                  //                 setState(() {
                  //                   _dropdownType = newValue!;
                  //                 });
                  //               },
                  //               items: [
                  //                 'Multiple Choice',
                  //                 'True or False',
                  //                 'Keywords'
                  //               ].map<DropdownMenuItem<String>>(
                  //                   (String value) {
                  //                 return DropdownMenuItem<String>(
                  //                   value: value,
                  //                   child: Text(value),
                  //                 );
                  //               }).toList(),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
                  //       child: Container(
                  //         height: 40,
                  //         color: HWTheme.darkGray,
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 12.0),
                  //           child: DropdownButtonHideUnderline(
                  //             child: DropdownButton<String>(
                  //               dropdownColor: HWTheme.darkGray,
                  //               value: _dropdownPoints,
                  //               icon: const Icon(
                  //                 FontAwesomeIcons.caretDown,
                  //                 color: Colors.white,
                  //                 size: 32,
                  //               ),
                  //               style: HWTheme
                  //                   .lightTheme.textTheme.headline5
                  //                   ?.copyWith(
                  //                       color: Colors.white,
                  //                       fontSize: 16),
                  //               onChanged: (String? newValue) {
                  //                 setState(() {
                  //                   _dropdownPoints = newValue!;
                  //                 });
                  //               },
                  //               items: ['500', '400', '300', '200', '100']
                  //                   .map<DropdownMenuItem<String>>(
                  //                       (String value) {
                  //                 return DropdownMenuItem<String>(
                  //                   value: value,
                  //                   child: Text(value),
                  //                 );
                  //               }).toList(),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // AnswerView(question: widget.question),
                  // DropdownButtons(
                  //     type: widget.question.type, dropdownPoints: dropdownPoints),
                  //MultipleChoiceSection(),
                  //KeywordSection(),
                  //TrueFalseType(),
                  // RangeType(),
                  // BottomActions(
                  //   onDeletePressed: widget.onDeletePressed,
                  // )
                  //========================bottom buttons======================
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            FontAwesomeIcons.solidTrashAlt,
                            color: HWTheme.burgundy,
                            size: 32,
                          ),
                          onPressed: () {
                            widget.onDeletePressed(widget.question.id!);
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.read<QuestionCubit>().updateQuestion(
                                    widget.question
                                        .copyWith(question: tempQuestion),
                                  );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                HWTheme.darkBurgundy),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                      color: HWTheme.darkBurgundy)),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: HWTheme.lightTheme.textTheme.headline6
                                ?.copyWith(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
