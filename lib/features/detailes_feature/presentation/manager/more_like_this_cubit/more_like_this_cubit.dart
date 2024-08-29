import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/more_like_this_repo/more_like_this_repo.dart';
import 'package:movies_app/features/detailes_feature/presentation/manager/more_like_this_cubit/more_like_this_state.dart';

class MoreLikeThisCubit extends Cubit<MoreLikeThisState> {
  MoreLikeThisCubit(this.moreLikeThisRepo) : super(MoreLikeThisStateInitial());

  final MoreLikeThisRepo moreLikeThisRepo;

  getMoreLikeThisMovies({required int id})
  async {
    emit(MoreLikeThisStateLoading());
    var result=await moreLikeThisRepo.getMoreLikeThisMovies(id: id);
    result.fold((e){
      emit(MoreLikeThisStateFailure(error: e.message));
    }, (movies){
      emit(MoreLikeThisStateSucess(movies: movies));
    });

  }
}
