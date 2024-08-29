import 'package:deep_fake/screens/auth/landingpage.dart';
import 'package:deep_fake/screens/home/home.dart';
import 'package:deep_fake/services/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: landingPage(),
    );
  }
}
