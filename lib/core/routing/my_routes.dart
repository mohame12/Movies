import 'package:flutter/cupertino.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/pages/movie_category.dart';
import 'package:movies_app/features/detailes_feature/presentation/pages/details_screen.dart';
import 'package:movies_app/features/detailes_feature/presentation/pages/trailer_creen.dart';
import 'package:movies_app/features/home_features/presentation/pages/home_screen.dart';
import 'package:movies_app/features/splash_screen/presentation/pages/splash_screen.dart';

class MyRoute
{
  static Map<String,WidgetBuilder> myRoutes=
  {
    SplashScreen.id: (context) => const SplashScreen(),
    HomeScreen.id: (context) =>const HomeScreen(),
    DetailsScreen.id: (context) =>const DetailsScreen(),
    MovieCategory.id: (context) =>const MovieCategory(),
    TrailerScreen.routeName: (context) =>const TrailerScreen(),
  };

}