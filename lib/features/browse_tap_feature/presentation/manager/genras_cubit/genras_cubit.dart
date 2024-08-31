

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/browse_tap_feature/data/repositories/genras_repo/genras_repo.dart';

import 'genras_state.dart';

class GenrasCubit extends Cubit<GenrasState> {
  GenrasCubit(this.genrasRepo) : super(GenrasInitial());

  final GenrasRepo genrasRepo;

  Future<void> fetchGenras() async {
    emit(GenrasLoading());
    var result=await genrasRepo.getGenras();
    result.fold((e){
      emit(GenrasFailure(error: e.message));
    }, (genras){
      emit(GenrasSucess(browse: genras));
    });
  }
}
