import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/my_assets.dart';
import '../themes/my_colors.dart';

class WatchListComponatntOn extends StatelessWidget {
  const WatchListComponatntOn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior:Clip.antiAlias,
      alignment: Alignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(6.w))
            ,child: const Image(image: AssetImage(MyAssets.bokkMarkOnIcon))),
        const Icon(Icons.check,color: MyColors.whiteColor,size: 16,),
      ],
    );
  }
}