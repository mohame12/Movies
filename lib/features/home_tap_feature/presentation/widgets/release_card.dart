import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/my_assets.dart';
import '../../../../core/widgets/watch_list_componant.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.w),
      ),
      child:   Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.w)
              ,child: Image(image: AssetImage(MyAssets.test2Image))),
          WatchListComponatnt()
        ],
      ),
    );
  }
}