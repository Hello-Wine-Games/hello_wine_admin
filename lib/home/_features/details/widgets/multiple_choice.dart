import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

class MultipleChoiceType extends StatefulWidget {
  const MultipleChoiceType(
      {Key? key, required this.question, required this.notifyParentAnswer})
      : super(key: key);

  final Question question;
  final Function(List<dynamic> something) notifyParentAnswer;

  @override
  _MultipleChoiceTypeState createState() => _MultipleChoiceTypeState();
}

class _MultipleChoiceTypeState extends State<MultipleChoiceType> {
  var answer2 = <dynamic>[
    {'answer': 'answer1', 'correct': false},
    {'answer': 'answer2', 'correct': false},
    {'answer': 'answer3', 'correct': false},
    {
      'answer': 'answer4',
      'correct': false,
    }
  ];

  @override
  void initState() {
    widget.notifyParentAnswer(<dynamic>[
      {'answer': 'answer1', 'correct': false},
      {'answer': 'answer2', 'correct': false},
      {'answer': 'answer3', 'correct': false},
      {'answer': 'answer4', 'correct': false},
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choices:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 16),
              ),
              Text(
                'Correct Answer:',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),

        /// If the type is multiple choice
        /// then build it with answer
        /// or build it with temp answers
        Container(
          height: 350,
          child: widget.question.type! == 'Multiple Choice'
              ? ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final answer = widget.question.answers![index];
                    return CreateChoice(
                      type: widget.question.type!,
                      // key: Key(
                      //     '${widget.question.id!}${widget.question.answers![index]['answer']}'),
                      id: widget.question.id!,
                      notifyParentAnswer: widget.notifyParentAnswer,
                      tempAnswer: answer2,
                      answer: answer['answer'],
                      isAnswer: answer['correct'],
                      label: index + 1,
                    );
                  },
                  itemCount: widget.question.answers!.length,
                )
              : ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return CreateChoice(
                      type: widget.question.type!,
                      // key: Key(
                      //     '${widget.question.id!}${answer2[index]['answer']}'),
                      id: widget.question.id!,
                      notifyParentAnswer: widget.notifyParentAnswer,
                      tempAnswer: answer2,
                      answer: answer2[index]['answer'],
                      isAnswer: answer2[index]['correct'],
                      label: index + 1,
                    );
                  },
                  itemCount: 4,
                ),
        ),
      ],
    );
  }
}

class CreateChoice extends StatelessWidget {
  const CreateChoice({
    Key? key,
    required this.type,
    required this.id,
    required this.notifyParentAnswer,
    required this.tempAnswer,
    required this.label,
    required this.isAnswer,
    required this.answer,
  }) : super(key: key);

  final Function(List<dynamic> something) notifyParentAnswer;
  final List<dynamic> tempAnswer;
  final int label;
  final bool isAnswer;
  final String answer;
  final String id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '$label: ',
                style: HWTheme.lightTheme.textTheme.headline5
                    ?.copyWith(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: 50,
                  width: 500,
                  child: TextFormField(
                    key: Key('$id$type$answer${DateTime.now().toString}'),
                    onSaved: (value) async {
                      tempAnswer[label - 1]['answer'] = value;
                      // print('onsaved');
                      await notifyParentAnswer(tempAnswer);
                    },
                    validator: (val) {
                      return val!.trim().isEmpty
                          ? 'Please enter some text'
                          : null;
                    },
                    initialValue: answer,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: HWTheme.darkGray),
                      ),
                    ),
                    style: HWTheme.lightTheme.textTheme.headline6
                        ?.copyWith(fontSize: 16, color: HWTheme.darkGray),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Checkboxx(
              correct: isAnswer,
              index: label - 1,
              tempAnswer: tempAnswer,
              notifyParentAnswer: notifyParentAnswer,
            ),
          ),
        ],
      ),
    );
  }
}

class Checkboxx extends StatefulWidget {
  Checkboxx(
      {Key? key,
      required this.correct,
      required this.notifyParentAnswer,
      required this.tempAnswer,
      required this.index})
      : super(key: key);

  final Function(List<dynamic> something) notifyParentAnswer;
  final List<dynamic> tempAnswer;
  final int index;
  bool correct;

  @override
  _CheckboxxState createState() => _CheckboxxState();
}

class _CheckboxxState extends State<Checkboxx> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.correct,
      onChanged: (newValue) {
        widget.tempAnswer[widget.index]['correct'] = newValue;
        setState(
          () {
            widget.correct = newValue!;
            widget.notifyParentAnswer(widget.tempAnswer);
          },
        );
      },
    );
  }
}
