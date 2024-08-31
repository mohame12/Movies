import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/networking/dio_helper.dart';
import 'package:movies_app/core/routing/my_routes.dart';
import 'package:movies_app/core/themes/my_themes.dart';
import 'package:movies_app/features/browse_tap_feature/data/repositories/genras_repo/genras_repo_imp.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/manager/genras_cubit/genras_cubit.dart';
import 'package:movies_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'bloc_observer.dart';
import 'features/home_tap_feature/data/repositories/popular_repo/popular_repo_imp.dart';
import 'features/home_tap_feature/data/repositories/recommended_repo/recommended_repo_imp.dart';
import 'features/home_tap_feature/data/repositories/release_repo/release_repo_imp.dart';
import 'features/home_tap_feature/presentation/manager/popular_cubit/pubular_cubit.dart';
import 'features/home_tap_feature/presentation/manager/recommended_cubit/recommended_cubit.dart';
import 'features/home_tap_feature/presentation/manager/release_cubit/release_cubit.dart';
import 'firebase_options.dart';


Future<void> main ()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PubularCubit(PopularRepoImp())..getPopularMovies(),),
          BlocProvider(create: (context) =>  ReleaseCubit(ReleaseRepoImp())..getReleaseMovies(),),
          BlocProvider(create: (context) => RecommendedCubit(RecommendedRepoImp())..fetchRecommendedMovies(),),
          BlocProvider(create: (context) => GenrasCubit(GenrasRepoImp())..fetchGenras(),),

        ],
        child: MaterialApp(
          theme: MyThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          routes: MyRoute.myRoutes,

        ),
      ),
    );
  }
}

