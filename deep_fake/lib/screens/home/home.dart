import 'package:deep_fake/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:deep_fake/widgets/bottomnavbar.dart';

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

  void _submit() {
    // Implement submit logic here
    print('File: $_fileName');
    print('Analysis Type: $_analysisType');
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<VideoUploadService>().isLoading;

    return Scaffold(
      body: 
         Container(
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
      
     bottomNavigationBar: BottomNavBar(currentIndex: 0),
      
    );
  }
}
