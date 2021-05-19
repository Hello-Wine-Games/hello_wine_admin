import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:questions_repository/questions_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.repository})
      : super(const CategoriesState.loading());

  final QuestionsRepository repository;

  Future<void> updateCategory(String category) async {
    emit(CategoriesState.success(category));
  }
}
