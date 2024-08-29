import 'package:dartz/dartz.dart';
import '../../../../../core/networking/failure.dart';
import '../../../../home_tap_feature/data/models/popular_model.dart';


abstract class MoreLikeThisRepo {
  Future<Either<Failure,List<Results>>>getMoreLikeThisMovies({required int id});

}