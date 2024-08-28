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
      elevation: 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.w),
      ),
      child:  const Stack(
        children: [
          Image(image: AssetImage(MyAssets.test2Image)),
          WatchListComponatnt()
        ],
      ),
    );
  }
}