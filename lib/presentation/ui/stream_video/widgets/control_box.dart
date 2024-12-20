import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/extensions.dart';
import 'package:movies_app/presentation/ui/stream_video/view_model/stream_video_view_model.dart';
import 'package:video_player/video_player.dart';

class ControlBox extends StatelessWidget {
  const ControlBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Visibility(
        visible: context.watch<StreamVideoViewModel>().isShowControl,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: ColorsManager.mainGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VideoProgressIndicator(
                context.watch<StreamVideoViewModel>().videoPlayerController,
                padding: const EdgeInsets.all(12.0),
                colors: VideoProgressColors(
                  playedColor: ColorsManager.red,
                  bufferedColor: ColorsManager.secondaryGrey.withOpacity(0.5),
                ),
                allowScrubbing: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.watch<StreamVideoViewModel>().currentMinutes.formatvideoStreamDuration}'
                      ':'
                      '${context.watch<StreamVideoViewModel>().currentSeconds.formatvideoStreamDuration}',
                      style: const TextStyle(color: ColorsManager.white),
                    ),
                    Text(
                      '${context.watch<StreamVideoViewModel>().totalMinutes.formatvideoStreamDuration}'
                      ':'
                      '${context.watch<StreamVideoViewModel>().totalSeconds.formatvideoStreamDuration}',
                      style: const TextStyle(color: ColorsManager.white),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    splashRadius: 0.1,
                    onPressed: () {
                      context.read<StreamVideoViewModel>().seek(-10);
                    },
                    color: ColorsManager.white,
                    icon: const Icon(
                      Icons.replay_10_rounded,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 30.w),
                  IconButton(
                    splashRadius: 0.1,
                    onPressed: () {
                      context.read<StreamVideoViewModel>().play();
                    },
                    color: ColorsManager.white,
                    icon: context.watch<StreamVideoViewModel>().isplaying
                        ? const Icon(
                            Icons.pause_rounded,
                            size: 36,
                          )
                        : const Icon(
                            Icons.play_arrow_rounded,
                            size: 36,
                          ),
                  ),
                  SizedBox(width: 30.w),
                  IconButton(
                    splashRadius: 0.1,
                    onPressed: () {
                      context.read<StreamVideoViewModel>().seek(10);
                    },
                    color: ColorsManager.white,
                    icon: const Icon(
                      Icons.forward_10_outlined,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
