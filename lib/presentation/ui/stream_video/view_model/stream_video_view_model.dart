import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/ui/stream_video/view_model/stream_view_state.dart';
import 'package:video_player/video_player.dart';

class StreamVideoViewModel extends Cubit<StreamVideoState> {
  StreamVideoViewModel() : super(StreamVideoLoadingState());
  late VideoPlayerController videoPlayerController;
  int currentSeconds = 0;
  int currentMinutes = 0;
  int totalSeconds = 0;
  int totalMinutes = 0;
  bool isplaying = false;
  bool isShowControl = true;
  Timer? _timer;

  Future<void> initVideo() async {
    emit(StreamVideoLoadingState());
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      ),
    )..addListener(
        () {
          currentSeconds = videoPlayerController.value.position.inSeconds % 60;
          currentMinutes = videoPlayerController.value.position.inMinutes % 60;
          emit(ChangePlayedDuration());
        },
      );
    try {
      await videoPlayerController.initialize();
      await videoPlayerController.setVolume(1.0);
      await play();
      totalSeconds = videoPlayerController.value.duration.inSeconds % 60;
      totalMinutes = videoPlayerController.value.duration.inMinutes % 60;
      emit(StreamVideoSuccessState());
    } on Exception catch (exception) {
      emit(StreamVideoErrorState(erroMessage: exception.toString()));
    }
  }

  Future<void> play() async {
    if (isplaying) {
      await videoPlayerController.pause();
      isplaying = false;
    } else {
      await videoPlayerController.play();
      isplaying = true;
    }
    showControl();
    emit(TogglePlayState());
  }

  Future<void> seek(int value) async {
    showControl();
    await videoPlayerController.seekTo(
      Duration(seconds: videoPlayerController.value.position.inSeconds + value),
    );
  }

  void hideControl() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(
      const Duration(seconds: 5),
      () => isShowControl = false,
    );
    emit(HideControlStateState());
  }

  void showControl() {
    isShowControl = true;
    emit(ShowControlStateState());
    hideControl();
  }
}
