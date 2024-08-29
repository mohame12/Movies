import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home_tap_feature/data/repositories/popular_repo/popular_rep.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/popular_cubit/pubular_state.dart';

class PubularCubit extends Cubit<PubularState> {
  PubularCubit(this.popularRepo) : super(PubularInitial());

  static PubularCubit get(context)=>BlocProvider.of(context);
  final PopularRepo popularRepo;

  getPopularMovies()
  async {
    emit(PubularLoading());
    var result=await popularRepo.getPopularMovies();
    result.fold((e){
      emit(PubularFailure(error: e.message));
    }, (movies){
      emit(PubularSucess(movies: movies));
    });

  }
}
