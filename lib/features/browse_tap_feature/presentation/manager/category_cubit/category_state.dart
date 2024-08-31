

import '../../../../home_tap_feature/data/models/popular_model.dart';

class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategorySucess extends CategoryState {
  final List<Results> category;

  CategorySucess({required this.category});
}
class CategoryLoading extends CategoryState {}
class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure({required this.error});
}
