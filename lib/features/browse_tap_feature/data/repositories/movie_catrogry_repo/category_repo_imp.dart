import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/networking/failure.dart';
import 'package:movies_app/features/browse_tap_feature/data/repositories/movie_catrogry_repo/category_repo.dart';
import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';
import '../../../../../core/networking/api_const.dart';
import '../../../../../core/networking/dio_helper.dart';


class CategoryRepoImp implements CategoryRepo{
  @override
  Future<Either<Failure, List<Results>>> getCategory({required int id}) async {
    try {
      Response response = await DioHelper.getData(
          endPoint: "discover/movie?with_genres=$id", token: ApiConst.token);
      Map<String, dynamic>data = response.data;
      List<Results> category = [];
      for(var item in data["results"])
      {
        category.add(Results.fromJson(item));
      }
      return right(category);
    }catch(e) {
      if(e is DioException)
      {
        return Left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}