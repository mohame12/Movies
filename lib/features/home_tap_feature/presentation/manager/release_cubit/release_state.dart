import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';

class ReleaseState {}

class ReleaseInitial extends ReleaseState {}
class ReleaseLoading extends ReleaseState {}
class ReleaseSucess extends ReleaseState {
  final List<Results> movies;

  ReleaseSucess({required this.movies});
}
class ReleaseFailure extends ReleaseState {
  final String error;

  ReleaseFailure({required this.error});
}
