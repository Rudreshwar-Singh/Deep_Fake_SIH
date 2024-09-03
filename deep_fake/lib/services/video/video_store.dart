import 'package:flutter/material.dart';

class VideoAnalysis {
  final String videoName;
  final String summary;
  final List<String> inconsistencies;
  final String technicalAnalysis;
  final double probabilityScore;

  VideoAnalysis({
    required this.videoName,
    required this.summary,
    required this.inconsistencies,
    required this.technicalAnalysis,
    required this.probabilityScore,
  });
}

class VideoAnalysisProvider with ChangeNotifier {
  List<VideoAnalysis> _videoAnalyses = [];

  List<VideoAnalysis> get videoAnalyses => _videoAnalyses;

  void addVideoAnalysis(VideoAnalysis videoAnalysis) {
    _videoAnalyses.add(videoAnalysis);
    notifyListeners();
  }
}
