import 'package:movies_app/features/detailes_feature/data/models/details_model/trailer_model.dart';

class GetTrailerState {}

class GetTrailerInitial extends GetTrailerState {}
class GetTrailerLoading extends GetTrailerState {}
class GetTrailerSucess extends GetTrailerState {
  final Results trailer;

  GetTrailerSucess({required this.trailer});
}
class GetTrailerFailure extends GetTrailerState {
  final String error;

  GetTrailerFailure({required this.error});
}
