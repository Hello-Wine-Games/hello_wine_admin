import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';
import 'package:hello_wine_admin/home/_features/features.dart';
import 'package:hello_wine_admin/home/home.dart';
import 'package:questions_repository/questions_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(repository: context.read<QuestionsRepository>()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(
        repository: context.read<QuestionsRepository>(),
        categoriesCubit: BlocProvider.of<CategoriesCubit>(context),
      )..fetchQuestions('Winemaking Process'),
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DeetsCubit(questionCubit: context.read<QuestionCubit>()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 50,
          leadingWidth: 200,
          leading: Row(
            children: [
              SizedBox(height: 50, child: HWImages.wineGlassIcon()),
              Text(
                'Admin',
                style: HWTheme.lightTheme.textTheme.headline1
                    ?.copyWith(fontSize: 30),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: AdminButton(title: 'Logout'),
            )
          ],
        ),
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Categories(
                categoriesChange: (String category) =>
                    {context.read<CategoriesCubit>().updateCategory(category)},
              ),
            ),
            const Expanded(
              flex: 3,
              child: QuestionsView(),
            ),
            const Expanded(
              flex: 7,
              child: Details(),
            )
          ],
        ),
      ),
    );
  }
}
