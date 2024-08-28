import 'package:flutter/cupertino.dart';
import 'package:movies_app/features/splash_screen/presentation/pages/splash_screen.dart';

class MyRoute
{
  static Map<String,WidgetBuilder> myRoutes=
  {
    SplashScreen.id: (context) => const SplashScreen(),

  };

}