import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/themes/my_assets.dart';
import 'package:movies_app/core/themes/my_styles.dart';
import 'package:movies_app/features/home_features/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id="SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    animationControl();
    timeOut();

  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void animationControl() {
    animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 600));
    slideAnimation=Tween<Offset>(end: Offset.zero,begin:const Offset(2,0) ).animate(animationController);
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Center(child: Image(image: AssetImage(MyAssets.splashLogo),fit: BoxFit.cover,)),
          const Spacer(),
          AnimatedBuilder(
            builder: (context,_) {
              return SlideTransition(position: slideAnimation,
              child: Text('Created By Sama & Mohamed',style:MyStyles.font18YellowPoppins,));
            }, animation: slideAnimation,
          ),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }

  void timeOut() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomeScreen.id);
      animationController.reverse();
    });
  }
}
