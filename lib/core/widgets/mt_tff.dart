import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/features/search_tap_feature/presentation/manager/search_cubit.dart';
import 'package:movies_app/features/search_tap_feature/presentation/manager/search_state.dart';

import '../themes/my_colors.dart';

class MyTFF extends StatelessWidget {
  const MyTFF({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (val) {
            BlocProvider.of<SearchCubit>(context).onChan(val);
          },
          cursorColor: MyColors.yellowColor,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.w),
              borderSide: BorderSide(color: Colors.grey, width: 0.5.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.w),
              borderSide: BorderSide(
                color: MyColors.yellowColor, width: 0.5.w,
              ),
            ),
            hintText: "Search...",
            hintStyle: TextStyle(color: MyColors.greyColor.withOpacity(0.5)),
            fillColor: MyColors.fillColor,
            filled: true,
            prefixIcon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.grey,
              size: 20,
            ),
          ),
        );
      },
    );
  }
}
