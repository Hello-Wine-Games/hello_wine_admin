import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/app/app.dart';
import 'package:questions_repository/questions_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required QuestionsRepository questionsRepository,
  })  : _authenticationRepository = authenticationRepository,
        _questionsRepository = questionsRepository,
        super(key: key);
  final AuthenticationRepository _authenticationRepository;
  final QuestionsRepository _questionsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _questionsRepository),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
