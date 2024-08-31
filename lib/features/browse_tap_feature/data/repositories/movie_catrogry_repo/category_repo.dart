import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';
import '../../../../../core/networking/failure.dart';



abstract class CategoryRepo {
  Future<Either<Failure,List<Results>>>getCategory({required int id});

}