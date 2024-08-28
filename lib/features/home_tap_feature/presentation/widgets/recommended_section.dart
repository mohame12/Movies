import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/recommended_list_view.dart';
import '../../../../core/themes/my_styles.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding:  EdgeInsetsDirectional.only(start: 24.w),
          child: Text('Recomended',style: MyStyles.font15WhiteInter,),
        ),
        SizedBox(height: 15.h,),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w),
          child: SizedBox(
            height: 200.h,
            child: const RecommendedListView(),
          ),
        ),
      ],
    );
  }
}


