 import 'package:flutter/material.dart';
 import 'package:file_picker/file_picker.dart';





// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String? _videoPath;
//   String _analysisSummary = 'Upload a video to analyze for deep fake.';

//   // Dummy function to simulate deep fake detection process
//   Future<void> _analyzeVideo() async {
//     setState(() {
//       _analysisSummary = 'Analyzing video...';
//     });

//     // Simulate a delay for analysis
//     await Future.delayed(Duration(seconds: 3));

//     setState(() {
//       _analysisSummary = '''
//       Summary: The video has been analyzed.
//       Inconsistencies Observed: None
//       Technical Analysis: The video shows smooth facial movements with no artifacts.
//       Probability Score: 5% chance of being a deep fake.
//       ''';
//     });
//   }

//   Future<void> _pickVideo() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//     );

//     if (result != null) {
//       setState(() {
//         _videoPath = result.files.single.path;
//       });

//       // Perform analysis
//       _analyzeVideo();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Deep Fake Detection'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton(
//               onPressed: _pickVideo,
//               child: Text('Upload Video'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   _analysisSummary,
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fileName = 'No file chosen';
  String _analysisType = 'Spatial Analysis';

   Future<void> _chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    } else {
      // User canceled the picker
      setState(() {
        _fileName = 'No file chosen';
      });
    }
  }

  void _submit() {
    // Implement submit logic here
    print('File: $_fileName');
    print('Analysis Type: $_analysisType');
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Upload Video for Analysis',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: _chooseFile,
                        child: Text('Choose File'),
                      ),
                    SizedBox(width: 8),
                      Text(
                    _fileName,
                    style: TextStyle(color: Colors.white70),
                  ),
                    ],
                  ),
                ),
                // 
                
                SizedBox(height: 16),
                Text(
                  'Select Analysis Type:',
                  style: TextStyle(color: Colors.white70),
                ),
                DropdownButton<String>(
                  value: _analysisType,
                  dropdownColor: Color.fromARGB(255, 20, 182, 236),
                  onChanged: (String? newValue) {
                    setState(() {
                      _analysisType = newValue!;
                    });
                  },
                  items: <String>['Spatial Analysis', 'Temporal Analysis']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Color.fromARGB(255, 67, 40, 239))),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}