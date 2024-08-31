import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/themes/my_styles.dart';
import '../widgets/browse_grid_view.dart';

class BrowseTap extends StatelessWidget {
  const BrowseTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Padding(
          padding: EdgeInsetsDirectional.only(start: 25.w,end: 25.w,top: 77.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Browse Category ",style: MyStyles.font22WhitePoppens,),
               const BrowseGridView()
            ],
          ),
        )
    );
  }
}




