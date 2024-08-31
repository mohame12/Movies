import 'package:flutter/material.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/recommended_section.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/release_section.dart';
import '../widgets/carsoul_section.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarsoulSlider(),
            ReleaseSection(),
            RecommendedSection(),
          ],
        ),
      );
  }
}




