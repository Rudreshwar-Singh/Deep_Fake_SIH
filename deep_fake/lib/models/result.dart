class DeepFakeAnalysis {
  final String summary;
  final List<String> inconsistencies;
  final String technicalAnalysis;
  final double probabilityScore;

  DeepFakeAnalysis({
    required this.summary,
    required this.inconsistencies,
    required this.technicalAnalysis,
    required this.probabilityScore,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'summary': summary,
  //     'inconsistencies': inco,
  //     'email': email,
  //     'password': password,
     
  //   };
  // }
  

  factory DeepFakeAnalysis.fromJson(Map<String, dynamic> json) {
    return DeepFakeAnalysis(
      summary: json['summary'],
      inconsistencies: List<String>.from(json['inconsistencies']),
      technicalAnalysis: json['technicalAnalysis'],
      probabilityScore: json['probabilityScore'],
    );
  }
}
