

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/browse_tap_feature/data/repositories/movie_catrogry_repo/category_repo.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());
  final CategoryRepo categoryRepo;

  categoryMovie ({required int id})
  async {
    emit(CategoryLoading());
    var result=await categoryRepo.getCategory(id: id);
    result.fold((e){
      emit(CategoryFailure(error: e.message));
    }, (movie){
      emit(CategorySucess(category: movie));
    });
  }
}
