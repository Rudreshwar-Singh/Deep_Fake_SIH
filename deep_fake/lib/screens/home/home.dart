import 'package:deep_fake/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:deep_fake/screens/home/about.dart';
import 'package:file_picker/file_picker.dart';
// import 'bottom_nav_bar.dart';  // Import the new BottomNavBar widget

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2; // Initial active index is 2 (Add Page)
  final PageController _pageController = PageController(initialPage: 2);

  final List<Widget> _pages = [
    HomePage(),
    AboutUsPage(),
    // CollectionPage(),
    // AddPage(),
    // ContactPage(),
    // ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

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
