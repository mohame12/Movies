import 'package:flutter/material.dart';

import '../../../../core/themes/my_assets.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';

class GridItemList extends StatelessWidget {
  const GridItemList({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(image: AssetImage(MyAssets.testImage),fit: BoxFit.cover)
          ),
        ),
        Container(
          width: double.infinity,
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
        Text(title,style: MyStyles.font16WhitePoppens,)
      ],
    );
  }
}