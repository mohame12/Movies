import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies_app/core/themes/my_colors.dart';

import '../manager/nav_cubit/nav_cubit.dart';

class GNavBar extends StatelessWidget {
  const GNavBar({
    super.key,
    required this.cubit,
  });
  final NavCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 10.h),
      child: GNav(
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: const Color(0xff232023), width: 1),
          curve: Curves.easeInExpo, // tab animation curves
          duration: const Duration(milliseconds: 800),
          gap: 8,
          color: Colors.grey,
          activeColor: MyColors.yellowColor,
          tabBackgroundColor: const Color(0xff232023),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          selectedIndex: cubit.selectedTap,
          onTabChange: cubit.onTap,
          tabs: cubit.gnav),
    );
  }
}
