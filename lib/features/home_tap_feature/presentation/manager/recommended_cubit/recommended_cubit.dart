

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home_tap_feature/data/repositories/recommended_repo/recommended_repo.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/recommended_cubit/recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.recommendedRepo) : super(RecommendedInitial());
  final RecommendedRepo recommendedRepo;
  Future<void> fetchRecommendedMovies() async {
    var result = await recommendedRepo.getRecommendedMovies();
    result.fold((e){
      emit(RecommendedFailure(error: e.message));
    }, (movies){
      emit(RecommendedSucess(movies: movies));
    });
  }
}
