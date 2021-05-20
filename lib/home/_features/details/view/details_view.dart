import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:questions_repository/questions_repository.dart';

import '../../questions/question.dart';
import '../details.dart';
import '../widgets/widgets.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeetsCubit, DeetsState>(
      builder: (context, state) {
        switch (state.status) {
          case DeetStatus.failure:
            return const Center(child: Text('Oops something went wrong!'));
          case DeetStatus.loading:
            return const Center(child: Text('no content'));
          default:
            return _DetailsView(
              question: state.question,
            );
        }
      },
    );
  }
}

class _DetailsView extends StatefulWidget {
  const _DetailsView({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  __DetailsViewState createState() => __DetailsViewState();
}

class __DetailsViewState extends State<_DetailsView> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionField(
                    key: Key(widget.question.id!),
                    question: widget.question,
                    onSaved: (value) =>
                        context.read<DeetsCubit>().update(value),
                    onUpdated: (value) =>
                        context.read<DeetsCubit>().updatedField(),
                  ),
                  AnswerView(
                    question: widget.question,
                  ),
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
                            context
                                .read<QuestionCubit>()
                                .deleteQuestion(widget.question.id!);
                          },
                        ),
                        TextButton(
                          /// If the details had been updated
                          onPressed: (context.read<DeetsCubit>().state.status ==
                                  DeetStatus.updated)
                              ? () async {
                                  /// If the form validates
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    print('save');

                                    /// copy the temp question from details
                                    /// and update the question list
                                    final question = context
                                        .read<DeetsCubit>()
                                        .state
                                        .question;
                                    await context
                                        .read<QuestionCubit>()
                                        .updateQuestion(question);

                                    /// this works :D it just refreshes the detail view
                                    await context.read<DeetsCubit>().reload();

                                    _formKey.currentState!.reset();
                                  }
                                }
                              : null,
                          style: (context.read<DeetsCubit>().state.status ==
                                  DeetStatus.updated)
                              ? ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          HWTheme.darkBurgundy),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(20),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                            color: HWTheme.darkBurgundy)),
                                  ),
                                )
                              : ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          HWTheme.darkGray),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(20),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                            color: HWTheme.darkGray)),
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
