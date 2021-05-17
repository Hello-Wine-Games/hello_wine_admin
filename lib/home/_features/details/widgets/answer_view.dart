import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';
import './widgets.dart';

class AnswerView extends StatefulWidget {
  AnswerView({
    Key? key,
    required this.question,
    required this.notifyParent,
    required this.dropdownValue,
    required this.valueList,
    required this.bgColor,
  }) : super(key: key);

  String dropdownValue;
  final List<String> valueList;
  final Color bgColor;
  final Function(String something) notifyParent;
  final Question question;

  @override
  _AnswerViewState createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
  @override
  Widget build(BuildContext context) {
    var _type = ValueNotifier<String>(widget.dropdownValue);

    return Expanded(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Container(
                height: 40,
                width: 200,
                color: widget.bgColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: widget.bgColor,
                      value: widget.dropdownValue,
                      icon: const Icon(
                        FontAwesomeIcons.caretDown,
                        color: Colors.white,
                        size: 32,
                      ),
                      style: HWTheme.lightTheme.textTheme.headline5
                          ?.copyWith(color: Colors.white, fontSize: 16),
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.dropdownValue = newValue!;
                          widget.notifyParent(newValue);
                        });
                      },
                      items: widget.valueList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, String type, Widget? child) {
                // This builder will only get called when the _counter
                // is updated.
                switch (type) {
                  case ('Multiple Choice'):
                    return const MultipleChoiceType();
                  case ('True or False'):
                    return const TrueFalseType();
                  case ('Keyword'):
                    return const KeywordType();
                  default:
                    return const Text('default');
                }

                // return Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     Text('$type'),
                //     child!,
                //   ],
                // );
              },
              valueListenable: _type,
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              child: Container(
                height: 100,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Text(widget.question.answers![index]['answer']),
                        Text(widget.question.answers![index]['correct']
                            .toString()),
                      ],
                    );
                  },
                  itemCount: widget.question.answers!.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
