import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/watch_list_componant.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/recommended_list_item.dart';
import '../../../../core/themes/my_assets.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';
import '../../../../core/widgets/watch_list_componant_on.dart';
import '../../../detailes_feature/presentation/pages/details_screen.dart';
import '../manager/get_fav_cubit/get_fav_cubit.dart';
import '../manager/get_fav_cubit/get_fav_state.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFavCubit()..getTasks(),
      child: BlocBuilder<GetFavCubit, GetFavState>(
        builder: (context, state) {
          if (state is GetFavSucess) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 20.w, end: 20.w, top: 40.h),
                child: GridView.builder(
                  itemCount: state.favorites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 30.0,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: (){
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.id,
                            arguments: state.favorites[index].details!
                            .id,
                          );
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        RecommendedListItem(
                            image: state.favorites[index].details?.posterPath ?? "",
                            title: state.favorites[index].details?.title ?? "",
                            date: state.favorites[index].details?.releaseDate ?? "",
                            rate: state.favorites[index].details?.voteAverage),
                              Positioned(
                                left: 3.5,
                                top: 3.5,
                                child: GestureDetector(
                                    onTap: (){
                                      BlocProvider.of<GetFavCubit>(context).deleteTask(state.favorites[index].docID??"");
                                    },
                                    child:state.favorites[index].isFav?  const WatchListComponatntOn():const WatchListComponatntOff()),
                              )

                      ],
                    ),
                  ),
                )

                );
          } else if (state is GetFavFailure) {
            return _buildEmptyState();
          } else if (state is GetFavLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.yellowColor,
              ),
            );
          }
          return _buildEmptyState();
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(MyAssets.noMovies),
            height: 90.h,
            width: 79.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Add movies",
            style: MyStyles.font13GreyPoppens,
          ),
        ],
      ),
    );
  }
}
