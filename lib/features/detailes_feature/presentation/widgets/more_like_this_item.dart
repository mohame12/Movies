import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/themes/my_styles.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/more_like_this_repo/more_like_this_repo_imp.dart';
import 'package:movies_app/features/detailes_feature/presentation/manager/more_like_this_cubit/more_like_this_cubit.dart';
import 'package:movies_app/features/detailes_feature/presentation/manager/more_like_this_cubit/more_like_this_state.dart';
import 'package:movies_app/features/detailes_feature/presentation/pages/details_screen.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../home_tap_feature/presentation/widgets/recommended_list_item.dart';

class MoreLikeThisList extends StatelessWidget {
  const MoreLikeThisList({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreLikeThisCubit(MoreLikeThisRepoImp())
        ..getMoreLikeThisMovies(id: id),
      child: BlocBuilder<MoreLikeThisCubit, MoreLikeThisState>(
        builder: (context, state) {
          if(state is MoreLikeThisStateSucess) {
            return Padding(
              padding: EdgeInsetsDirectional.only(start: 24.w),
              child: SizedBox(
                height: 190.h,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                     GestureDetector(
                       onTap: ()
                       {
                         Navigator.pushNamed(context,DetailsScreen.id, arguments:state.movies[index].id );
                       },
                       child: RecommendedListItem(
                        image: "${state.movies[index].posterPath}",
                        title: "${state.movies[index].title}",
                        date: "${state.movies[index].releaseDate}",
                        rate: state.movies[index].voteAverage.toString().substring(0,3),
                                           ),
                     ),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          width: 14.w,
                        ),
                    itemCount:state.movies.length),
              ),
            );
          }else if(state is MoreLikeThisStateFailure)
            {
              return  Center(
                child: Text('Error loading data',style: MyStyles.font18YellowPoppins,),
              );
            }
          return SizedBox(
              width:double.infinity,
              height: 128.h,
              child: const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.yellowColor,
                  )));
        },
      ),
    );
  }
}
