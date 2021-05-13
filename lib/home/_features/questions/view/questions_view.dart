import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../question.dart';

class QuestionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        switch (state.status) {
          case QuestionStatus.failure:
            return const Center(child: Text('Oops something went wrong!'));
          case QuestionStatus.success:
            return _QuestionView(
                questions: state.questions, category: state.category);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView(
      {Key? key, required this.questions, required this.category})
      : super(key: key);

  final List<Question> questions;
  final String category;

  @override
  Widget build(BuildContext context) {
    return questions.isEmpty
        ? const Center(child: Text('no content'))
        : Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 44),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: HWTheme.grayOutline,
                        ),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.read<QuestionCubit>().state.category,
                            style: HWTheme.lightTheme.textTheme.headline5
                                ?.copyWith(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Questions (${context.read<QuestionCubit>().state.questions.length})',
                                style: HWTheme.lightTheme.textTheme.headline5
                                    ?.copyWith(
                                        fontSize: 20, color: HWTheme.darkGray),
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: HWTheme.burgundy,
                                padding: const EdgeInsets.all(10.0),
                                shape: const CircleBorder(),
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _QuestionTile(
                        question: questions[index],
                        isSelected: index ==
                            context
                                .read<QuestionCubit>()
                                .state
                                .selectedQuestion,
                        onSelected: (id) {
                          context
                              .read<QuestionCubit>()
                              .updateSelected(id, index, category);
                        },
                        // onDeletePressed: (id) {
                        //   context.read<QuestionCubit>().deleteItem(id);
                        // },
                      );
                    },
                    itemCount: questions.length,
                  ),
                ),
              ],
            ),
          );
  }
}

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({
    Key? key,
    required this.question,
    required this.onSelected,
    required this.isSelected,
  }) : super(key: key);

  final Question question;
  final ValueSetter<String> onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? HWTheme.burgundy : HWTheme.grayOutline,
          width: isSelected ? 2.0 : 1.0,
        ),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          onSelected(question.id!);
        },
        leading: Text(
          '500',
          style: isSelected
              ? HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: HWTheme.burgundy)
              : HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(color: HWTheme.darkGray),
        ),
        selected: isSelected,
        title: Text(
          question.question!,
          style: TextStyle(
              color: isSelected ? HWTheme.burgundy : HWTheme.darkGray),
        ),
      ),
    );
  }
}
