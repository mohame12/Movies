import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/recommended_list_item.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>


            const RecommendedListItem(),

        separatorBuilder:(context, index) => SizedBox(width: 14.w,) ,
        itemCount:10 );
  }
}

