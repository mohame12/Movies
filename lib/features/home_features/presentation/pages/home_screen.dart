import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movies_app/core/themes/my_colors.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id="HomeScreen";


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 10.h),
        child: GNav(
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: const Color(0xff232023), width: 1), // tab button border
            curve: Curves.easeInExpo, // tab animation curves
            duration: const Duration(milliseconds: 800),
            gap: 8,
            color: Colors.grey,
            activeColor: MyColors.yellowColor,
            tabBackgroundColor: const Color(0xff232023),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h), // navigation bar padding

            tabs:  const [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.heart,
            text: 'Likes',
          ),
          GButton(
            icon: LineIcons.search,
            text: 'Search',
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
          )
        ]),
      )
    );
  }
}
