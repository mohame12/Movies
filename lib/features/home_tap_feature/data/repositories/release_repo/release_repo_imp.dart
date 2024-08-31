import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/networking/failure.dart';
import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';
import 'package:movies_app/features/home_tap_feature/data/repositories/release_repo/release_repo.dart';

import '../../../../../core/networking/api_const.dart';
import '../../../../../core/networking/dio_helper.dart';

class ReleaseRepoImp implements ReleaseRepo{
  @override
  Future<Either<Failure, List<Results>>> getReleasesMovies() async {
    try {
      Response response = await DioHelper.getData(
          endPoint: ApiConst.releasesMovies, token: ApiConst.token);
      Map<String, dynamic>data = response.data;
      List<Results> movies = [];
      for (var item in data["results"]) {
        movies.add(Results.fromJson(item));
      }
      return Right(movies);
    }catch(e) {
      if(e is DioException)
      {
        return Left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}