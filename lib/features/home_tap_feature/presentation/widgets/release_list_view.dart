import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/detailes_feature/presentation/pages/details_screen.dart';
import 'package:movies_app/features/home_tap_feature/data/repositories/release_repo/release_repo_imp.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/release_cubit/release_state.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/release_card.dart';

import '../../../../core/themes/my_colors.dart';
import '../manager/release_cubit/release_cubit.dart';

class ReleaseListView extends StatelessWidget {
  const ReleaseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ReleaseCubit(ReleaseRepoImp())
        ..getReleaseMovies(),
      child: BlocBuilder<ReleaseCubit,ReleaseState >(
        builder: (context, state) {
          if(state is ReleaseSucess) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(4.w),
                      child: GestureDetector(
                          onTap: ()
                          {
                            Navigator.pushNamed(context, DetailsScreen.id,arguments: state.movies[index].id);
                          },
                          child: CardList(image: state.movies[index].posterPath??"",)),
                    ),
                separatorBuilder: (context, index) => SizedBox(width: 14.w,),
                itemCount:state.movies.length);
          }
          else if(state is ReleaseFailure)
            {
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
      ),
    );
  }
}