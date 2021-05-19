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
          case DeetStatus.success:
            return _DetailsView(
              question: state.question,
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
              // onChanged: () => setState(
              //     () => _enableBtn = _formKey.currentState!.validate()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionField(
                    question: widget.question,
                    onSaved: (value) =>
                        context.read<DeetsCubit>().updateQuestion(value),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              print('save');
                              final question =
                                  context.read<DeetsCubit>().state.question;
                              await context
                                  .read<QuestionCubit>()
                                  .updateQuestion(question);

                              /// this is literally just so I can make the
                              /// simplest of updates. Will is cause bugs?
                              /// I hope not !

                              await context
                                  .read<DeetsCubit>()
                                  .success(question.copyWith(isDeleting: true));
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
