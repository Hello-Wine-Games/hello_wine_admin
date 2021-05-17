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
          case QuestionStatus.empty:
            return const Center(child: Text('no content'));
          case QuestionStatus.success:
            return _DetailsView(
              question: state.selectedQuestion,
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
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController()..text = widget.question.question!;
    var _dropdownType = widget.question.type;
    var _dropdownPoints = widget.question.points! as int?;
    var tempQuestion = 'question';

    var initialDropdownType = widget.question.type!;
    var initialDropdownPoints = widget.question.points;

    void refresh(String childValue) {
      _dropdownType = childValue;
    }

    void refresh2(int childValue) {
      _dropdownPoints = childValue;
    }

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
              // onChanged: () => setState(
              //     () => _enableBtn = _formKey.currentState!.validate()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      DropDownButton2(
                        notifyParent: refresh2,
                        dropdownValue: initialDropdownPoints!.toInt(),
                        valueList: [500, 400, 300, 200, 100],
                        bgColor: HWTheme.darkGray,
                      ),
                      TextFormField(
                        controller: _controller,
                        onTap: () => _controller.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: _controller.value.text.length),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        key: Key(widget.question.question!),
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
                  // ========================Answer===========================
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Answer:',
                              style: HWTheme.lightTheme.textTheme.headline5
                                  ?.copyWith(fontSize: 20),
                            ),
                          ),
                          DropDownButton(
                            notifyParent: refresh,
                            dropdownValue: initialDropdownType,
                            valueList: [
                              'Multiple Choice',
                              'True or False',
                              'Keywords'
                            ],
                            bgColor: HWTheme.burgundy,
                            isPoints: false,
                          ),
                          Text(_dropdownType!),
                          Container(
                            height: 100,
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Text(widget.question.answers![index]
                                        ['answer']),
                                    Text(widget
                                        .question.answers![index]['correct']
                                        .toString()),
                                  ],
                                );
                              },
                              itemCount: widget.question.answers!.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await context
                                  .read<QuestionCubit>()
                                  .updateQuestion(
                                    widget.question.copyWith(
                                        question: tempQuestion,
                                        type: _dropdownType,
                                        points: _dropdownPoints!.toDouble()),
                                  );
                              _formKey.currentState!.reset();
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

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
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
// Expanded(
//   child: ListView.builder(
//     itemBuilder: (BuildContext context, int index) {
//       return Row(
//         children: [
//           Text(question.answers![index]['answer']),
//           Text(question.answers![index]['correct'].toString()),
//         ],
//       );
//     },
//     itemCount: question.answers!.length,
//           ),
//         )
//       ],
//     );
//   }
// }
