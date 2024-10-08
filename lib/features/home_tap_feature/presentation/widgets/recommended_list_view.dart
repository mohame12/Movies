import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/recommended_cubit/recommended_cubit.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/recommended_cubit/recommended_state.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/recommended_list_item.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../detailes_feature/presentation/pages/details_screen.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedState>(
      builder: (context, state) {
        if (state is RecommendedSucess) {
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  GestureDetector(
                onTap: ()
                {
                  Navigator.pushNamed(context, DetailsScreen.id,arguments: state.movies[index].id);
                },
                child: RecommendedListItem(
                    image: state.movies[index].posterPath ?? "",
                    title: state.movies[index].originalTitle ?? '',
                    date: state.movies[index].releaseDate ?? "",
                    rate: state.movies[index].voteAverage ?? "", w: 110.h, h: 200.w,),
              ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 14.w,
                  ),
              itemCount: state.movies.length);
        } else if (state is RecommendedFailure) {
          return const Center(child: Text('Failed to load movies'));
        }
        return SizedBox(
            width:double.infinity,
            height: 128.h,
            child: const Center(
                child: CircularProgressIndicator(
              color: MyColors.yellowColor,
            )));
      },
    );
  }
}
