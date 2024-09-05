// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class SpatialAnalysisPage extends StatefulWidget {
//   final String videoPath;

//   SpatialAnalysisPage({required this.videoPath});

//   @override
//   _SpatialAnalysisPageState createState() => _SpatialAnalysisPageState();
// }

// class _SpatialAnalysisPageState extends State<SpatialAnalysisPage> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then((_) {
//         setState(() {}); // Refresh to display video once initialized
//         _controller.play(); // Start playing the video
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Spatial Analysis'),
//       ),
//       body: Container(decoration: BoxDecoration(
//               gradient:LinearGradient(
//   colors: [Color(0xFFFFFFFF), Color(0xFFFFE0B2), Color(0xFFFAF9F6)],
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
// )




          
//             ),
//         child: SingleChildScrollView(
//           child: Container(
//             height: 500,
//             child: Center(
//               child: _controller.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: _controller.value.aspectRatio,
//                       child: VideoPlayer(_controller),
//                     )
//                   : CircularProgressIndicator(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


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

  // Example data
  final Map<String, dynamic> deepFakeAnalysis = {
    'summary': 'This is a summary of the deep fake analysis.',
    'inconsistencies': [
      'Facial movements are unnatural in frame 123.',
      'Lighting inconsistency detected in frame 456.',
      'Lip synchronization issue detected in frame 789.',
    ],
    'technicalAnalysis': 'The video shows multiple signs of deep fake manipulation, including unnatural facial expressions and lighting inconsistencies. The probability of this video being a deep fake is high.',
    'probabilityScore': 87, // Example score
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
        title: Text('Spatial Analysis'),
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
                      deepFakeAnalysis['summary'],
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
                    for (String issue in deepFakeAnalysis['inconsistencies'])
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
                      deepFakeAnalysis['technicalAnalysis'],
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
                      '${deepFakeAnalysis['probabilityScore']}%',
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
