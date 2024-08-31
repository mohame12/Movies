import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/networking/failure.dart';
import 'package:movies_app/features/detailes_feature/data/models/details_model/trailer_model.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/get_trailer_repo/get_trailer_repo.dart';
import '../../../../../core/networking/api_const.dart';
import '../../../../../core/networking/dio_helper.dart';

class GetTrailerRepoImp implements GetTrailerRepo{
  @override
  Future<Either<Failure, Results>> getTrailerMovie({required int id}) async {
    try {
      Response response = await DioHelper.getData(
          endPoint: "movie/$id/videos", token: ApiConst.token);
      Map<String, dynamic>data = response.data;
      List<Results>trailer=[];
      for(var item in data["results"])
        {
          trailer.add(Results.fromJson(item));
        }
      return right(trailer[0]);
    }catch(e) {
      if(e is DioException)
      {
        return Left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}