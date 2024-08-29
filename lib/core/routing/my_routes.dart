import 'package:flutter/cupertino.dart';
import 'package:movies_app/features/detailes_feature/presentation/pages/details_screen.dart';
import 'package:movies_app/features/home_features/presentation/pages/home_screen.dart';
import 'package:movies_app/features/splash_screen/presentation/pages/splash_screen.dart';

class MyRoute
{
  static Map<String,WidgetBuilder> myRoutes=
  {
    SplashScreen.id: (context) => const SplashScreen(),
    HomeScreen.id: (context) =>const HomeScreen(),
    DetailsScreen.id: (context) =>const DetailsScreen(),

  };

}