import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/details_repo/details_repo_imp.dart';
import 'package:movies_app/features/detailes_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movies_app/features/detailes_feature/presentation/manager/details_cubit/details_state.dart';
import 'package:movies_app/features/home_features/presentation/pages/home_screen.dart';
import '../../../../core/networking/api_const.dart';
import '../../../../core/themes/my_assets.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';
import '../../../../core/widgets/watch_list_componant.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(DetailsRepoImp())..getDetails(id: id),
      child: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is DetailsSucess) {
            return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width:412.w ,
                    height: 689.h,
                    fit: BoxFit.cover,
                    imageUrl: "${ApiConst.imageUrl}${state.model.backdropPath}",
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                          child: CircularProgressIndicator(
                              color: MyColors.yellowColor,
                              value: downloadProgress.progress),
                        ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Container(
                  height: 703.h,
                  width: 412.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        MyColors.blackColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.05, 1],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${state.model.title}",
                          style: GoogleFonts.abrilFatface(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),)
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${state.model.releaseDate}",
                          style: MyStyles.font13GreyPoppens,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.w),
                            child: Stack(
                              children: [

                                CachedNetworkImage(
                                  width:129.w ,
                                  height: 199.h,
                                  fit: BoxFit.cover,
                                  imageUrl: "${ApiConst.imageUrl}${state.model.posterPath}",
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Center(
                                        child: CircularProgressIndicator(
                                            color: MyColors.yellowColor,
                                            value: downloadProgress.progress),
                                      ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                                const WatchListComponatnt()
                              ],
                            ),
                          ),
                          SizedBox(width: 11.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          Container(

                                            height: 30.h,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5.w),
                                                side: const BorderSide(
                                                    color: MyColors
                                                        .bookMarkOffColor),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                                              child: Center(
                                                child: Text(
                                                  "${state.model.genres![index].name}",
                                                  style: MyStyles
                                                      .font10GreyPoppens,
                                                ),
                                              ),
                                            ),
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                      itemCount: state.model.genres!.length),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "${state.model.overview}",maxLines: 7,overflow:TextOverflow.ellipsis ,style: MyStyles.font13GreyPoppens,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Image(image: AssetImage(MyAssets.starIcon)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      state.model.voteAverage.toString().substring(0,3),
                                      style: MyStyles.font18YellowPoppins
                                          .copyWith(color: MyColors.greyColor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                 Positioned(
                     top: 50.h,
                     left: 15.w,
                     child: GestureDetector(
                         onTap: ()
                         {
                           Navigator.popUntil(context, ModalRoute.withName(HomeScreen.id));
                         },
                         child: const Icon(Icons.arrow_back,color: Colors.white,))),
              ],
            );
          }else if(state is DetailsFailer)
            {
              return  Center(child: Text('Failed to load movie details',style: MyStyles.font18YellowPoppins,));
            }
          return
              SizedBox(
                height: 492.h,
                width: 412.w,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.yellowColor,
                  ),
                ),
              );
        },
      ),
    );
  }
}
