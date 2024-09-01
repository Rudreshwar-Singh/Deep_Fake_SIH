import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TemporalAnalysisPage extends StatefulWidget {
  final String videoPath;

  TemporalAnalysisPage({required this.videoPath});

  @override
  _TemporalAnalysisPageState createState() => _TemporalAnalysisPageState();
}

class _TemporalAnalysisPageState extends State<TemporalAnalysisPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {}); // Refresh to display video once initialized
        _controller.play(); // Start playing the video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temporal Analysis'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
