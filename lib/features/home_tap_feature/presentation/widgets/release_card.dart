import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/networking/api_const.dart';
import 'package:movies_app/core/themes/my_colors.dart';
import '../../../../core/widgets/watch_list_componant.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key, required this.image,
  });

  final String image ;


  @override
  Widget build(BuildContext context) {
          return Card(
            color: Colors.transparent,
            elevation: 0.8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.w)

                    , child:
                CachedNetworkImage(
                  width:96.w ,
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
                const WatchListComponatntOff()
              ],
            )



    );
  }
}