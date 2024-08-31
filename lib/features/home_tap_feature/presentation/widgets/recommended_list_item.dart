import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_const.dart';
import '../../../../core/themes/my_assets.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';

class RecommendedListItem extends StatelessWidget {
  const RecommendedListItem({
    super.key, required this.image, required this.title, required this.date, required this.rate,  this.w,  this.h,
  });

  final String image;

  final String title ;

  final String date;

  final dynamic  rate;
  final dynamic w;
  final dynamic h;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(10.w),
      child: SizedBox(
        width: 110.w
        ,
        height: 200.h,
        child: Card(
          color: Colors.transparent,
          elevation: 0.6,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:

                CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: w,
                  height:h ,
                  imageUrl: "${ApiConst.imageUrl}$image",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                          width: 110.w,
                          height:200.h ,
                          child: Center(child: CircularProgressIndicator(color: MyColors.yellowColor,value: downloadProgress.progress))),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),


                // Image(image: const AssetImage(MyAssets.test2Image),
                //   fit: BoxFit.cover,
                //   width: 110.w,
                //   height: 200.w,
                // ),
              ),
              Container(
                // height:200.h ,
                // width: 110.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.transparent,
                      MyColors.recommendCardBackColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 1],
                  ),
                ),
              ),
              // const WatchListComponatntOff(),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Image(image: AssetImage(MyAssets.starIcon)),
                        SizedBox(width: 4.5.w,),
                        Text("$rate",style: MyStyles.font10GreyPoppens,)
                      ],
                    ),
                    Text(title,style: MyStyles.font12WhitePoppens),
                    Text(date,style: MyStyles.font10GreyPoppens),
                    SizedBox(height: 10.h,)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}