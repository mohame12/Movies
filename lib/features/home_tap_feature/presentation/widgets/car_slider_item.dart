import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/my_assets.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';
import '../../../../core/widgets/watch_list_componant.dart';

class CarSlider extends StatelessWidget {
  const CarSlider({
    super.key,
  });

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
                      Image(
                        image: const AssetImage(MyAssets.testImage),
                        height: 289.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
                            child: const Stack(
                              children: [
                                Image(image: AssetImage(MyAssets.test2Image),fit: BoxFit.cover,width:129 ,height:199 ,),
                                WatchListComponatnt()
                              ],
                            )),
                        SizedBox(width: 14.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Dora and the lost city of gold',style: MyStyles.font14WhiteInter,),
                            SizedBox(height: 8.h,),
                            Text('2019  PG-13  2h 7m',style:MyStyles.font10GreyInter,)
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

