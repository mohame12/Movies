import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/themes/my_colors.dart';
import 'package:movies_app/features/detailes_feature/data/repositories/get_trailer_repo/get_trailer_repo_imp.dart';
import 'package:movies_app/features/detailes_feature/presentation/manager/get_tariler_cubit/get_trailer_cubit.dart';
import 'package:movies_app/features/detailes_feature/presentation/manager/get_tariler_cubit/get_trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends StatefulWidget {
  const TrailerScreen({super.key});
  static const String routeName = "trailer";

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => GetTrailerCubit(GetTrailerRepoImp())..getTrailer(id: id),
      child: Scaffold(
        body: BlocBuilder<GetTrailerCubit, GetTrailerState>(
          builder: (context, state) {
            if (state is GetTrailerSucess) {
              _controller = YoutubePlayerController(
                initialVideoId: state.trailer.key ?? "",
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              );

              return Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      _controller.play();
                    },
                  ),
                ),
              );
            } else if (state is GetTrailerFailure) {
              return const Center(
                child: Text(
                  'Failed to load trailer',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.yellowColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
