part of 'categories_cubit.dart';

enum CategoryStatus { loading, success, failure }

class CategoriesState extends Equatable {
  const CategoriesState._({
    this.status = CategoryStatus.loading,
    this.category = 'Winemaking Process',
  });

  const CategoriesState.loading() : this._();

  const CategoriesState.success(String category)
      : this._(status: CategoryStatus.success, category: category);

  const CategoriesState.failure() : this._(status: CategoryStatus.failure);

  final String category;
  final CategoryStatus status;

  @override
  List<Object> get props => [status, category];
}
