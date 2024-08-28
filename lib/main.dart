import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routing/my_routes.dart';
import 'package:movies_app/core/themes/my_themes.dart';
import 'package:movies_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'bloc_observer.dart';


void main ()
{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(412,892),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: MyThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: MyRoute.myRoutes,

      ),
    );
  }
}

