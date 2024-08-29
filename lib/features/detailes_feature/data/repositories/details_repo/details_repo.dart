import 'package:dartz/dartz.dart';
import 'package:movies_app/features/detailes_feature/data/models/details_model/DetailsModel.dart';
import '../../../../../core/networking/failure.dart';



abstract class DetailsRepo {
  Future<Either<Failure,DetailsModel>>getDetailsMovies({required int id});

}