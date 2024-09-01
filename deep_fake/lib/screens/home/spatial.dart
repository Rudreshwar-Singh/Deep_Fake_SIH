import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SpatialAnalysisPage extends StatefulWidget {
  final String videoPath;

  SpatialAnalysisPage({required this.videoPath});

  @override
  _SpatialAnalysisPageState createState() => _SpatialAnalysisPageState();
}

class _SpatialAnalysisPageState extends State<SpatialAnalysisPage> {
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
        title: Text('Spatial Analysis'),
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
