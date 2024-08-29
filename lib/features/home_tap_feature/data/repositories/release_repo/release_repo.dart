import 'package:dartz/dartz.dart';
import '../../../../../core/networking/failure.dart';
import '../../models/popular_model.dart';


abstract class ReleaseRepo {
  Future<Either<Failure,List<Results>>>getReleasesMovies();

}