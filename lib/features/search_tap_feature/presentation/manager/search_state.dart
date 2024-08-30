import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';

class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSucess extends SearchState {
  final List<Results> movies;

  SearchSucess({required this.movies});
}
class SearchFailure extends SearchState {
  final String error;

  SearchFailure({required this.error});
}
