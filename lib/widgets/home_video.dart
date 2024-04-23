import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:pcg/change_notifiers/video_notifier.dart';
import 'package:pcg/pages/home.dart';
import 'package:pcg/change_notifiers/video_notifier.dart';

class HomeVideo extends StatefulWidget {
  final String videoUrl;
  final VideoNotifier videoNotifier;

  const HomeVideo(
      {Key? key, required this.videoUrl, required this.videoNotifier})
      : super(key: key);

  @override
  _HomeVideoState createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  @override
  Widget build(BuildContext context) {
    videoPlayerController.initialize().then((_) {
      videoNotifier.videoIsInitialised();
    });

    CustomVideoPlayerController customVideoPlayerController =
        CustomVideoPlayerController(
            context: context,
            videoPlayerController: videoPlayerController,
            customVideoPlayerSettings: CustomVideoPlayerSettings(
                showDurationPlayed: false,
                showDurationRemaining: false,
                settingsButtonAvailable: false,
                playbackSpeedButtonAvailable: false));
    customVideoPlayerController.videoPlayerController.setVolume(0.7);

    return ListenableBuilder(
        listenable: widget.videoNotifier,
        builder: (BuildContext context, Widget? child) {
          return widget.videoNotifier.isVideoInitialised
              ? AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: CustomVideoPlayer(
                      customVideoPlayerController: customVideoPlayerController),
                )
              : Container(
                  height: 200, // Placeholder height
                  child: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
