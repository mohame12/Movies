import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home_features/presentation/manager/nav_cubit/nav_cubit.dart';
import 'package:movies_app/features/home_features/presentation/manager/nav_cubit/nav_state.dart';
import 'package:movies_app/features/home_features/presentation/widgets/g_nav_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavCubit(),
      child: BlocBuilder<NavCubit,NavState>(
        builder: (context, state) {
          NavCubit cubit=NavCubit.get(context);
          return Scaffold(
            body: cubit.listOfBoby[cubit.selectedTap],
              bottomNavigationBar: GNavBar(cubit:cubit,));
        },
      ),
    );
  }
}


