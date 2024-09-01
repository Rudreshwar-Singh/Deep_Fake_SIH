

import 'package:deep_fake/models/history.dart';
import 'package:flutter/material.dart';

class VideoAnalysisProvider with ChangeNotifier {
  List<VideoAnalysis> _videoAnalyses = [];

  List<VideoAnalysis> get videoAnalyses => _videoAnalyses;

  void addVideoAnalysis(VideoAnalysis videoAnalysis) {
    _videoAnalyses.add(videoAnalysis);
    notifyListeners();
  }
}
