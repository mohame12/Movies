import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/details_repo/details_repo.dart';

import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitial());
  final DetailsRepo detailsRepo;


  void getDetails({required int id})
  async {
    emit(DetailsLoading());
    var res=await detailsRepo.getDetailsMovies(id: id);
    res.fold((e){
      emit(DetailsFailer(error: e.message));
    }, (details){
      emit(DetailsSucess(model: details));
    });
  }
}
