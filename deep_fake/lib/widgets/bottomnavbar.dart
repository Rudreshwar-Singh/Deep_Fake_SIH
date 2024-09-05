import 'package:deep_fake/screens/home/collection.dart';
import 'package:deep_fake/screens/home/contact.dart';
import 'package:deep_fake/screens/home/home.dart';
import 'package:deep_fake/screens/home/howitwork.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deep_fake/screens/home/about.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  BottomNavBar({required this.currentIndex});

  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AboutUsPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HowItWorksPage()),
        );
        
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ContactUsPage()),
        );
        break;
      case 4:
        // Navigate to the Video List Page when the Profile icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoListPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.amber,
      color: Colors.white,
      activeColor: Colors.black,
      style: TabStyle.fixedCircle,
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.save, title: 'Collection'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.phone, title: 'Contact'),
        TabItem(icon: Icons.person, title: 'Profile'),
      ],
      initialActiveIndex: currentIndex,
      onTap: (index) => _navigateToPage(index, context),
    );
  }
}
