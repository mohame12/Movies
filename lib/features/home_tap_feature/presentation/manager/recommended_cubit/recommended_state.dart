
import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';

class RecommendedState {}
class RecommendedInitial extends RecommendedState {}
class RecommendedSucess extends RecommendedState {
  final List<Results> movies;

  RecommendedSucess({required this.movies});
}
class RecommendedLoading extends RecommendedState {}
class RecommendedFailure extends RecommendedState {
  final String error;

  RecommendedFailure({required this.error});

}
