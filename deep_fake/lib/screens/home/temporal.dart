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

  // Example data for temporal analysis
  final Map<String, dynamic> temporalAnalysis = {
    'summary': 'This is a summary of the temporal analysis of the video.',
    'inconsistencies': [
      'Frame rate mismatch detected in segments 45-67.',
      'Temporal artifacts found in transitions between frames 89 and 102.',
      'Movement inconsistency detected in frame 150.',
    ],
    'technicalAnalysis': 'The video shows multiple temporal inconsistencies, including frame rate mismatches and unusual movement artifacts. The probability of this video being a deep fake is moderate.',
    'probabilityScore': 65, // Example score
  };

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFFFE0B2), Color(0xFFFAF9F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300, // Adjust video container height as needed
                child: Center(
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 20), // Space between video and summary
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Summary:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      temporalAnalysis['summary'],
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Inconsistencies:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (String issue in temporalAnalysis['inconsistencies'])
                      Text(
                        '- $issue',
                        style: TextStyle(fontSize: 16),
                      ),
                    const SizedBox(height: 20),
                    Text(
                      'Technical Analysis:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      temporalAnalysis['technicalAnalysis'],
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Probability Score:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${temporalAnalysis['probabilityScore']}%',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
