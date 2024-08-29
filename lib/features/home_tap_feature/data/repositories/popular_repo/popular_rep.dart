import 'package:dartz/dartz.dart';
import 'package:movies_app/core/networking/failure.dart';

import '../../models/popular_model.dart';

abstract class PopularRepo {
  Future<Either<Failure,List<Results>>>getPopularMovies();

}