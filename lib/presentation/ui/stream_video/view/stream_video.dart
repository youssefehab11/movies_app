import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/ui/stream_video/view_model/stream_video_view_model.dart';
import 'package:movies_app/presentation/ui/stream_video/view_model/stream_view_state.dart';
import 'package:movies_app/presentation/ui/stream_video/widgets/control_box.dart';
import 'package:movies_app/presentation/ui/stream_video/widgets/video.dart';

class StreamVideo extends StatefulWidget {
  const StreamVideo({super.key});

  @override
  State<StreamVideo> createState() => _StreamVideoState();
}

class _StreamVideoState extends State<StreamVideo> {
  late StreamVideoViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = StreamVideoViewModel();
    viewModel.initVideo();
  }

  @override
  void dispose() {
    viewModel.videoPlayerController.dispose();
    viewModel.videoPlayerController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: GestureDetector(
        onTap: () => viewModel.showControl(),
        child: Scaffold(
          backgroundColor: ColorsManager.black,
          body: BlocBuilder<StreamVideoViewModel, StreamVideoState>(
            builder: (context, state) {
              if (state is StreamVideoErrorState) {
                Center(
                  child: Text(state.erroMessage),
                );
              }
              if (state is StreamVideoLoadingState) {
                return const LoadingWidget();
              }
              return const Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Video(),
                  ControlBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
