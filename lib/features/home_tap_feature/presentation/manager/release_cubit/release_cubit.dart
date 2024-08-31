

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home_tap_feature/data/repositories/release_repo/release_repo.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/release_cubit/release_state.dart';

class ReleaseCubit extends Cubit<ReleaseState> {
  ReleaseCubit(this.release) : super(ReleaseInitial());
  final ReleaseRepo release;

  getReleaseMovies()
  async {
    var result= await release.getReleasesMovies();
    result.fold((e){
      emit(ReleaseFailure(error: e.message));
    }, (movies){
      emit(ReleaseSucess(movies:movies ));
    });
  }
}
