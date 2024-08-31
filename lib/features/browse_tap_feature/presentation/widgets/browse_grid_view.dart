import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/themes/my_colors.dart';
import 'package:movies_app/core/themes/my_styles.dart';
import 'package:movies_app/features/browse_tap_feature/data/models/navigation_model/navigation_model.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/manager/genras_cubit/genras_cubit.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/manager/genras_cubit/genras_state.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/pages/movie_category.dart';
import 'package:movies_app/features/browse_tap_feature/presentation/widgets/grid_item.dart';

class BrowseGridView extends StatelessWidget {
  const BrowseGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenrasCubit, GenrasState>(
      builder: (context, state) {

        if (state is GenrasSucess) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 30.0,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) =>
                   GestureDetector(
                       onTap: ()
                       {
                         Navigator.pushNamed(context, MovieCategory.id,arguments:NavigationModel(name: state.browse[index].name!, id: state.browse[index].id));
                       },
                       child: GridItemList(title:state.browse[index].name??"",)),
              itemCount: state.browse.length,

            ),
          );
        }
        else if(state is GenrasFailure)
          {
            return  SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text('Failed to load Browse',style: MyStyles.font22WhitePoppens,),
              ),
            );
          }
        return const Expanded(child: Center(child: CircularProgressIndicator(color: MyColors.yellowColor,)));

      },
    );
  }
}