sealed class StreamVideoState {}

class StreamVideoSuccessState extends StreamVideoState {}

class StreamVideoLoadingState extends StreamVideoState {}

class StreamVideoErrorState extends StreamVideoState {
  String erroMessage;
  StreamVideoErrorState({required this.erroMessage});
}

class ChangePlayedDuration extends StreamVideoState {}

class TogglePlayState extends StreamVideoState {}

class ShowControlStateState extends StreamVideoState {}

class HideControlStateState extends StreamVideoState {}
