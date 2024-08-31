import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/search_tap_feature/data/repositories/search_repo_imp.dart';
import 'package:movies_app/features/search_tap_feature/presentation/manager/search_cubit.dart';
import '../widgets/search_list_view.dart';
import '../../../../core/widgets/mt_tff.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImp()),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 25.w, end: 25.w, top: 40.h),
          child: Column(
            children: const [
              MyTFF(),
              SearchListView(),
            ],
          ),
        ),
      ),
    );
  }
}
