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
