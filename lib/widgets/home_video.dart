import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeVideo extends StatefulWidget {
  final String videoUrl;

  const HomeVideo({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _HomeVideoState createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container(
            height: 200, // Placeholder height
            child: Center(child: CircularProgressIndicator()),
          );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
