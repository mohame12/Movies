import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/release_card.dart';

class ReleaseListView extends StatelessWidget {
  const ReleaseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(4.w),
              child: const CardList(),
            ),
        separatorBuilder:(context, index) => SizedBox(width: 14.w,) ,
        itemCount:10 );
  }
}