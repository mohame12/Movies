import 'package:dartz/dartz.dart';
import '../../../../../core/networking/failure.dart';
import '../../models/popular_model.dart';


abstract class RecommendedRepo {
  Future<Either<Failure,List<Results>>>getRecommendedMovies();

}