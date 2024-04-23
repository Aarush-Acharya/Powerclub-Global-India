import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

VideoNotifier videoNotifier = VideoNotifier();
var videoPlayerController =
    CachedVideoPlayerController.asset("assets/pcg-video.mp4");


class VideoNotifier extends ChangeNotifier {
  bool isVideoInitialised = false;

  videoIsInitialised() {
    isVideoInitialised = true;
    notifyListeners();
  }
}
