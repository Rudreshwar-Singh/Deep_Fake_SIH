import 'package:deep_fake/screens/auth/landingpage.dart';
import 'package:deep_fake/screens/auth/login.dart';
import 'package:deep_fake/screens/home/home.dart';
import 'package:deep_fake/services/auth/auth_provider.dart';
import 'package:deep_fake/services/contact/contact_provider.dart';
import 'package:deep_fake/services/video/video_store.dart';
import 'package:deep_fake/services/video/video_upload.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoUploadService(),
        ),
        
        ChangeNotifierProvider(
          create: (context) => VideoAnalysisProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: landingPage(),
    );
  }
}
