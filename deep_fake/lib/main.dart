import 'package:deep_fake/screens/auth/landingpage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());

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

