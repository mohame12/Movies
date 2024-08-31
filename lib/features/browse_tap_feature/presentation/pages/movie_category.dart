import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/themes/my_colors.dart';
import 'package:movies_app/core/themes/my_styles.dart';
import 'package:movies_app/features/browse_tap_feature/data/models/navigation_model/navigation_model.dart';
import 'package:movies_app/features/browse_tap_feature/data/repositories/movie_catrogry_repo/category_repo_imp.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/manager/category_cubit/category_cubit.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/manager/category_cubit/category_state.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/recommended_list_item.dart';
import '../../../detailes_feature/presentation/pages/details_screen.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({super.key});
  static const String id = "movie_category";
  @override
  Widget build(BuildContext context) {
    NavigationModel model =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    return Scaffold(
        body: Padding(
      padding: EdgeInsetsDirectional.only(start: 25.w, end: 25.w, top: 77.h),
      child: BlocProvider(
        create: (context) =>
            CategoryCubit(CategoryRepoImp())..categoryMovie(id: model.id),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySucess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: MyStyles.font22WhitePoppens,
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 30.0,
                        childAspectRatio: 1/1.5,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, DetailsScreen.id,arguments: state.category[index].id);
                        },
                        child: RecommendedListItem(
                            image: state.category[index].posterPath ?? "",
                            title: state.category[index].title ?? "",
                            date: state.category[index].releaseDate ?? "",
                            rate: state.category[index].voteAverage
                                    .toString()
                                    .substring(0, 3),),
                      ),
                      itemCount: state.category.length,
                    ),
                  )
                ],
              );
            } else if (state is CategoryFailure) {
              return const Center(child: Text("Failed to load data"));
            }
            return const SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                    child: CircularProgressIndicator(
                  color: MyColors.yellowColor,
                )));
          },
        ),
      ),
    ));
  }
}
