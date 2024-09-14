import 'package:deep_fake/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';

class UserTrain extends StatelessWidget {
  const UserTrain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User training"),
      ),
      body: Center(
        child: Text("train here"),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
