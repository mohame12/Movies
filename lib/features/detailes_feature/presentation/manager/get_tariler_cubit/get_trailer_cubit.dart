import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/get_trailer_repo/get_trailer_repo.dart';

import 'get_trailer_state.dart';

class GetTrailerCubit extends Cubit<GetTrailerState> {
  GetTrailerCubit(this.getTrailerRepo) : super(GetTrailerInitial());
  final GetTrailerRepo getTrailerRepo;

  Future<void> getTrailer({required int  id}) async {
    emit(GetTrailerLoading());
    var result = await getTrailerRepo.getTrailerMovie(id: id);
    result.fold((e){
      emit(GetTrailerFailure(error: e.message));
    }, (trailer){
      emit(GetTrailerSucess(trailer: trailer));
    });
  }
}
