import 'package:deep_fake/screens/auth/landingpage.dart';
import 'package:deep_fake/services/auth/auth_provider.dart';
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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: landingPage(),
    );
  }
}
