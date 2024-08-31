import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/networking/failure.dart';
import 'package:movies_app/features/browse_tap_feature/data/models/genres_model.dart';
import 'package:movies_app/features/browse_tap_feature/data/repositories/genras_repo/genras_repo.dart';
import '../../../../../core/networking/api_const.dart';
import '../../../../../core/networking/dio_helper.dart';


class GenrasRepoImp implements GenrasRepo{
  @override
  Future<Either<Failure, List<Genres>>> getGenras() async {
    try {
      Response response = await DioHelper.getData(
          endPoint: "genre/movie/list", token: ApiConst.token);
      Map<String, dynamic>data = response.data;
      List<Genres> genres = [];
      for(var item in data["genres"])
        {
          genres.add(Genres.fromJson(item));
        }
      return right(genres);
    }catch(e) {
      if(e is DioException)
      {
        return Left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}