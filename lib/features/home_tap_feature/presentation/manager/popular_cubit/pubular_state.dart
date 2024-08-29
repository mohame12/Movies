import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';

class PubularState {}

class PubularInitial extends PubularState {}
class PubularSucess extends PubularState {
  final List<Results> movies;

  PubularSucess({required this.movies});
}
class PubularLoading extends PubularState {}
class PubularFailure extends PubularState {
  final String error;

  PubularFailure({required this.error});
}
