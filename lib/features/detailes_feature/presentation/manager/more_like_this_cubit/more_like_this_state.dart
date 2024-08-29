import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';

class MoreLikeThisState {}

class MoreLikeThisStateInitial extends MoreLikeThisState {}
class MoreLikeThisStateSucess extends MoreLikeThisState {
  final List<Results> movies;

  MoreLikeThisStateSucess({required this.movies});

}
class MoreLikeThisStateLoading extends MoreLikeThisState {}
class MoreLikeThisStateFailure extends MoreLikeThisState {
  final String error;

  MoreLikeThisStateFailure({required this.error});

}
