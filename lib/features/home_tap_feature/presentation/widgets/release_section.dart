import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home_tap_feature/presentation/widgets/release_list_view.dart';
import '../../../../core/themes/my_styles.dart';

class ReleaseSection extends StatelessWidget {
  const ReleaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h,),
        Padding(
          padding:  EdgeInsetsDirectional.only(start: 27.w),
          child: Text("New Releases ",style:MyStyles.font15WhiteInter,),
        ),
        const SizedBox(height: 12,),
        Padding(
          padding:  EdgeInsetsDirectional.only(start:27.w),
          child: SizedBox(
            height: 150.h,
            child: const ReleaseListView(),
          ),
        ),
      ],
    );
  }
}




