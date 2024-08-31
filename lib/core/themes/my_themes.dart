import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/themes/my_colors.dart';

class MyThemes
{
  static ThemeData lightTheme=ThemeData.light().copyWith(
    scaffoldBackgroundColor: MyColors.blackColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,

      )
    )
  );
}