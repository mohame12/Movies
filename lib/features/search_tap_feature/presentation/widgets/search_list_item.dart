import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/networking/api_const.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';


class SearchListItem extends StatelessWidget {
  const SearchListItem({
    super.key, required this.image, required this.title, required this.date, required this.auth,
  });
  final String title;
  final String date;
  final String auth;

  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child:
            CachedNetworkImage(
            width:150.w ,
            height: 89.h,
            fit: BoxFit.cover,
            imageUrl: "${ApiConst.imageUrl}$image",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(
            child: CircularProgressIndicator(
            color: MyColors.yellowColor,
            value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: MyStyles.font15WhiteInter,),
              SizedBox(height: 5.h,),
              Text(date,style: MyStyles.font13GreyPoppens,),
              SizedBox(height: 5.h,),
              Text(auth,style: MyStyles.font13GreyPoppens,),
            ],
          ),
        )
      ],
    );
  }
}