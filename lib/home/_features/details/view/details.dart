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
              question: state.questions[state.selectedQuestion],
              onDeletePressed: (id) {
                context.read<QuestionCubit>().deleteQuestion(id);
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
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String dropdownValue = 'Multiple Choice';
  // String dropdownPoints = '500';

  String tempQuestion = 'question';
  // int _points = 0;
  // String _type = 'type';
  // List<dynamic> _answer = [
  //   {'answer': 'answer', 'correct': true}
  // ];

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                            ?.copyWith(fontSize: 20, color: HWTheme.darkGray),
                      ),
                    ],
                  ),

                  // QuestionField(
                  //     tempQuestion: tempQuestion,
                  //     question: widget.question.question!),
                  // AnswerView(question: question2),
                  // DropdownButtons(
                  //     type: widget.question.type, dropdownPoints: dropdownPoints),
                  //MultipleChoiceSection(),
                  //KeywordSection(),
                  //TrueFalseType(),
                  // RangeType(),
                  // BottomActions(
                  //   onDeletePressed: widget.onDeletePressed,
                  // )
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          FontAwesomeIcons.solidTrashAlt,
                          color: HWTheme.burgundy,
                          size: 40,
                        ),
                        onPressed: () {
                          context
                              .read<QuestionCubit>()
                              .deleteQuestion(widget.question.id!);
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<QuestionCubit>().updateAnswer(
                                  widget.question
                                      .copyWith(question: tempQuestion),
                                );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HWTheme.darkBurgundy),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(
                                    color: HWTheme.darkBurgundy)),
                          ),
                        ),
                        child: Text(
                          'submit',
                          style: HWTheme.lightTheme.textTheme.headline6
                              ?.copyWith(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
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
