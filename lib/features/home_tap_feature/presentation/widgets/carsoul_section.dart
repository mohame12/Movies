import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/themes/my_colors.dart';
import 'package:movies_app/features/detailes_feature/presentation/pages/details_screen.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/popular_cubit/pubular_cubit.dart';
import 'package:movies_app/features/home_tap_feature/presentation/manager/popular_cubit/pubular_state.dart';
import 'car_slider_item.dart';

class CarsoulSlider extends StatelessWidget {
  const CarsoulSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PubularCubit,PubularState>(
      listener: (context, state) {
      },
      builder: (context, state) {
       if(state is PubularSucess) {
         return SizedBox(
           height:289.h ,
           width: 412.w
           ,
           child: AspectRatio(
             aspectRatio: 3/9,
             child: CarouselSlider(
               items: state.movies.map((e){
                 return GestureDetector(
                     onTap: ()
                     {
                       Navigator.pushNamed(context, DetailsScreen.id,arguments: e.id);
                       print("${e.id}");
                     },
                     child: CarSlider(image: e.backdropPath??"", imagePoster: e.posterPath??"", title: e.originalTitle??'', date: e.releaseDate??''));
               }).toList(),


               options: CarouselOptions(
                 height: 289.h,
                 viewportFraction: BorderSide.strokeAlignOutside,
                 initialPage: 0,
                 enableInfiniteScroll: true,
                 reverse: false,
                 autoPlay: true,
                 autoPlayInterval: const Duration(seconds: 3),
                 autoPlayAnimationDuration: const Duration(milliseconds: 800),
                 autoPlayCurve: Curves.fastOutSlowIn,
                 enlargeCenterPage: true,
                 enlargeFactor: 0.3,
                 scrollDirection: Axis.horizontal,
               ),),
           ),
         );
       }
       else if (state is PubularFailure)
         {
           return Center(child: Text(state.error));
         }
       return  SizedBox(
         height: 289.h,
         width: 412.w,
         child: const Center(
           child: CircularProgressIndicator(
             color: MyColors.yellowColor,
           ),
         ),
       );
      },
    );
  }
}