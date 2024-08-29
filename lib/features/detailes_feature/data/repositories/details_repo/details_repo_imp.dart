import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/networking/failure.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/details_repo/details_repo.dart';
import '../../../../../core/networking/api_const.dart';
import '../../../../../core/networking/dio_helper.dart';
import '../../models/details_model/DetailsModel.dart';

class DetailsRepoImp implements DetailsRepo{
  @override
  Future<Either<Failure, DetailsModel>> getDetailsMovies({required int id}) async {
    try {
      Response response = await DioHelper.getData(
          endPoint: "$id", token: ApiConst.token);
      Map<String, dynamic>data = response.data;
      DetailsModel detailsModel=DetailsModel.fromJson(data);
      return right(detailsModel);
    }catch(e) {
      if(e is DioException)
      {
        return Left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}