import 'package:dartz/dartz.dart';
import 'package:movies_app/features/detailes_feature/data/models/details_model/trailer_model.dart';
import '../../../../../core/networking/failure.dart';



abstract class GetTrailerRepo {
  Future<Either<Failure,Results>>getTrailerMovie({required int id});

}