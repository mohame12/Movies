

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/pages/browse_tap.dart';
import 'package:movies_app/features/home_features/presentation/manager/nav_cubit/nav_state.dart';
import 'package:movies_app/features/home_tap_feature/presentation/pages/home_tap.dart';
import 'package:movies_app/features/search_tap_feature/presentation/pages/search_tap.dart';
import 'package:movies_app/features/watch_list_feature/presentation/pages/watch_list.dart';


class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());
  static NavCubit get(context)=>BlocProvider.of(context);

  List<GButton>gnav=[
    const GButton(
      icon: LineIcons.home,
      text: 'Home',
    ),
    const GButton(
      icon: LineIcons.search,
      text: 'Search',
    ),
    const GButton(
      icon:Icons.playlist_play,
      text: 'Browse',
    ),
    const GButton(
      icon: LineIcons.heart,
      text: 'Likes',
    ),
  ];

  List<Widget>listOfBoby=[
    const HomeTap(),
    const SearchTap(),
    const BrowseTap(),
    const WatchList(),
  ];


  int selectedTap=0;

  void onTap(int index){
    selectedTap=index;
    emit(NavChanged());
  }


}
