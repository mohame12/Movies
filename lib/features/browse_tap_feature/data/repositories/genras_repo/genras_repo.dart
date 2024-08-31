import 'package:dartz/dartz.dart';
import 'package:movies_app/features/browse_tap_feature/data/models/genres_model.dart';
import '../../../../../core/networking/failure.dart';



abstract class GenrasRepo {
  Future<Either<Failure,List<Genres>>>getGenras();

}