import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/networking/api_const.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';
import '../../../../core/widgets/watch_list_componant.dart';

class CarSlider extends StatelessWidget {
  const CarSlider({
    super.key, required this.image, required this.imagePoster, required this.title, required this.date,
  });
  final String image;
  final String imagePoster;
  final String title;
  final String date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:290.h ,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Card(

            margin: EdgeInsets.zero,
            color: Colors.transparent,
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    children: [

                      CachedNetworkImage(
                        imageUrl: "${ApiConst.imageUrl}$image",
                        fit: BoxFit.cover,
                        height: 289.h,
                        width: 412.w,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Center(child: CircularProgressIndicator(color: MyColors.yellowColor,value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),

                      Container(
                        height: 291.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              MyColors.blackColor,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 12],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: 22,
                    bottom: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5.w),
                            child:  Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "${ApiConst.imageUrl}$imagePoster",
                                  fit: BoxFit.cover,
                                width:129 ,height:199,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Center(child: CircularProgressIndicator(color:MyColors.yellowColor,value: downloadProgress.progress)),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                                const WatchListComponatnt()
                              ],
                            )),
                        SizedBox(width: 14.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(title,style: MyStyles.font14WhiteInter,),
                            SizedBox(height: 8.h,),
                            Text(date,style:MyStyles.font10GreyInter,)
                          ],
                        ),

                      ],
                    ))
              ],
            ),
          ),
          const Icon(Icons.play_circle,color: MyColors.whiteColor,size: 80,),
        ],
      ),
    );
  }
}

