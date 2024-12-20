import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/ui/stream_video/view_model/stream_video_view_model.dart';
import 'package:video_player/video_player.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: context
              .watch<StreamVideoViewModel>()
              .videoPlayerController
              .value
              .aspectRatio,
          child: VideoPlayer(
            context.read<StreamVideoViewModel>().videoPlayerController,
          ),
        ),
      ),
    );
  }
}
