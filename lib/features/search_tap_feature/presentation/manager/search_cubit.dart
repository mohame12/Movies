import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home_tap_feature/data/models/popular_model.dart';
import 'package:movies_app/features/search_tap_feature/data/repositories/search_repo.dart';
import 'package:movies_app/features/search_tap_feature/presentation/manager/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  String search = "";
  List<Results> m = [];

  void searchMovies() async {
    emit(SearchLoading());
    var result = await searchRepo.getSearchMovies(q: search);
    result.fold((e) {
      emit(SearchFailure(error: e.message));
    }, (movies) {
      m = movies;
      emit(SearchSucess(movies: movies));
    });
  }

  void onChan(val) {
    search = val;
    if (search.isEmpty) {
      emit(SearchInitial());
    } else {
      searchMovies();
    }
  }
}
