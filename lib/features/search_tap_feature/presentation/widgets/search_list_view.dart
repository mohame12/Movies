import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/themes/my_assets.dart';
import 'package:movies_app/core/themes/my_styles.dart';
import 'package:movies_app/features/detailes_feature/presentation/pages/details_screen.dart';
import 'package:movies_app/features/search_tap_feature/presentation/manager/search_cubit.dart';
import 'package:movies_app/features/search_tap_feature/presentation/manager/search_state.dart';
import 'package:movies_app/features/search_tap_feature/presentation/widgets/search_list_item.dart';

import '../../../../core/themes/my_colors.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {

        if (state is SearchSucess) {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, DetailsScreen.id,arguments: state.movies[index].id);
                },
                child: SearchListItem(
                  image: state.movies[index].posterPath ?? "",
                  title: state.movies[index].title ?? "",
                  date: state.movies[index].releaseDate ?? "",
                  auth: state.movies[index].originalTitle ?? '',
                ),
              ),
              separatorBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  Container(
                    height: 1,
                    color: MyColors.fillColor,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                ],
              ),
              itemCount: state.movies.length,
            ),
          );
        }
        else if (state is SearchFailure) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(MyAssets.noMovies),
                  height: 90.h,
                  width: 79.w,
                ),
                Text(
                  "No movies found",
                  style: MyStyles.font13GreyPoppens,
                ),
              ],
            ),
          );
        }
        else if (state is SearchLoading) {
          return  const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: MyColors.yellowColor,
              ),
            ),
          );
        }
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(MyAssets.noMovies),
                height: 90.h,
                width: 79.w,
              ),
              Text(
                "No movies found",
                style: MyStyles.font13GreyPoppens,
              ),
            ],
          ),
        );
      },
    );
  }
}
