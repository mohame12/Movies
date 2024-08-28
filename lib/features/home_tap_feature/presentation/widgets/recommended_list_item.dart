import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/my_assets.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';
import '../../../../core/widgets/watch_list_componant.dart';

class RecommendedListItem extends StatelessWidget {
  const RecommendedListItem({
    super.key,
  });

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
                Image(image: const AssetImage(MyAssets.test2Image),
                  fit: BoxFit.cover,
                  width: 110.w,
                  height: 200.w,
                ),
              ),
              Container(
                height:200.h ,
                width: 110.w,
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
              const WatchListComponatnt(),
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
                        Text('7.7',style: MyStyles.font10GreyPoppens,)
                      ],
                    ),
                    Text('Deadpool 2',style: MyStyles.font12WhitePoppens),
                    Text('2018  R  1h 59m',style: MyStyles.font10GreyPoppens),
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