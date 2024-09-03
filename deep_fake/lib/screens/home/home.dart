import 'package:deep_fake/models/history.dart';
import 'package:deep_fake/screens/home/spatial.dart';
import 'package:deep_fake/screens/home/temporal.dart';
import 'package:deep_fake/services/video/video_store.dart' as store;
import 'package:deep_fake/services/video/video_upload.dart';
import 'package:deep_fake/widgets/appbar.dart';
import 'package:deep_fake/widgets/bottomnavbar.dart';
import 'package:deep_fake/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fileName = 'No file chosen';
  String _filePath = '';
  String _analysisType = 'Spatial Analysis';

  Future<void> _chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path!;
      });
    } else {
      setState(() {
        _fileName = 'No file chosen';
        _filePath = '';
      });
    }
  }

  Future<void> _submit() async {
    if (_filePath.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please choose a file before submitting')),
      );
      return;
    }

    final uploadService = context.read<VideoUploadService>();

    try {
      await uploadService.uploadVideo(_filePath, _analysisType);

      if (uploadService.report != null) {
        final videoAnalysis = store.VideoAnalysis(
          videoName: _fileName,
          summary: uploadService.report!,
          inconsistencies: [
            'Detected inconsistencies that need to be provided by the backend',
          ],
          technicalAnalysis: 'Technical analysis provided by the backend',
          probabilityScore: uploadService.probabilityScore ?? 0.0,
        );

        context
            .read<store.VideoAnalysisProvider>()
            .addVideoAnalysis(videoAnalysis);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Video uploaded and analyzed successfully!')),
        );

        if (_analysisType == 'Spatial Analysis') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpatialAnalysisPage(videoPath: _filePath),
            ),
          );
        } else if (_analysisType == 'Temporal Analysis') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TemporalAnalysisPage(videoPath: _filePath),
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload video: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<VideoUploadService>().isLoading;

    return Scaffold(
      
      drawer: Sidebar(),
      appBar: Appbar_screen(),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
             height: 700,
            decoration: BoxDecoration(
              gradient:LinearGradient(
  colors: [Color(0xFFFFE0B2), Color(0xFFE6E6FA)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
)




          
            ),
            child: Center(
              
              
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // SizedBox(height: 20,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(textAlign: TextAlign.center,
                                'Upload Video for Analysis',
                                style: TextStyle(
                                
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 16,),
                    
                    Row(
                     
            children: [
               Padding(
                 padding: const EdgeInsets.only( left: 1.5, bottom: 40),
                 child: Image.asset(
                  'images/scanner.gif',
                   width: 404,
                  height: 300,
                  fit: BoxFit.cover,
                             ),
               ),
            
            ]
          ),
                      ],
                    ),
                    // SizedBox(height: 6,),
                   
                    // SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: _chooseFile,
                            child: Text('Choose File'),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: SafeArea(
                              child: Text(
                                _fileName,
                                style: TextStyle(color: Colors.white70),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          child: Text(
                            value,
                            style: TextStyle(color: Color.fromARGB(255, 67, 40, 239)),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isLoading ? null : _submit,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          
                ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
