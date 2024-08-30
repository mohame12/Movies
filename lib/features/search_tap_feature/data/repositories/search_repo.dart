import 'package:dartz/dartz.dart';
import '../../../../../core/networking/failure.dart';
import '../../../home_tap_feature/data/models/popular_model.dart';



abstract class SearchRepo {
  Future<Either<Failure,List<Results>>>getSearchMovies({required String q});

}