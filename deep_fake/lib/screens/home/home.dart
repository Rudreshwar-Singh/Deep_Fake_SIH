import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';





class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _videoPath;
  String _analysisSummary = 'Upload a video to analyze for deep fake.';

  // Dummy function to simulate deep fake detection process
  Future<void> _analyzeVideo() async {
    setState(() {
      _analysisSummary = 'Analyzing video...';
    });

    // Simulate a delay for analysis
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _analysisSummary = '''
      Summary: The video has been analyzed.
      Inconsistencies Observed: None
      Technical Analysis: The video shows smooth facial movements with no artifacts.
      Probability Score: 5% chance of being a deep fake.
      ''';
    });
  }

  Future<void> _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      setState(() {
        _videoPath = result.files.single.path;
      });

      // Perform analysis
      _analyzeVideo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Fake Detection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _pickVideo,
              child: Text('Upload Video'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _analysisSummary,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
