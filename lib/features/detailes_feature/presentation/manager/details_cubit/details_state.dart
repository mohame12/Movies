
import 'package:movies_app/features/detailes_feature/data/models/details_model/DetailsModel.dart';

class DetailsState {}

class DetailsInitial extends DetailsState {}
class DetailsLoading extends DetailsState {}
class DetailsSucess extends DetailsState {
  final DetailsModel model;

  DetailsSucess({required this.model});
}
class DetailsFailer extends DetailsState {
  final String error;

  DetailsFailer({required this.error});
}
