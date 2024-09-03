import 'package:deep_fake/services/video/video_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deep_fake/models/history.dart';
import 'package:deep_fake/screens/home/Result.dart';

class VideoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoAnalyses = context.watch<VideoAnalysisProvider>().videoAnalyses;

    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Videos'),
      ),
      body: ListView.builder(
        itemCount: videoAnalyses.length,
        itemBuilder: (context, index) {
          final video = videoAnalyses[index];

          return Card(
            margin: EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(video.videoName),
              children: [
                ListTile(
                  title: Text(video.summary),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Inconsistencies: ${video.inconsistencies.join(", ")}'),
                      Text('Technical Analysis: ${video.technicalAnalysis}'),
                      Text(
                          'Probability Score: ${video.probabilityScore.toStringAsFixed(2)}%'),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeepFakeAnalysisPage(
                            summary: video.summary,
                            inconsistencies: video.inconsistencies,
                            technicalAnalysis: video.technicalAnalysis,
                            probabilityScore: video.probabilityScore,
                          ),
                        ),
                      );
                    },
                    child: Text('Open Analysis'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
