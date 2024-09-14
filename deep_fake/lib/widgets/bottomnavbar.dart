import 'package:deep_fake/screens/home/collection.dart';
import 'package:deep_fake/screens/home/contact.dart';
import 'package:deep_fake/screens/home/home.dart';
import 'package:deep_fake/screens/home/howitwork.dart';
import 'package:deep_fake/screens/home/more_page.dart';
import 'package:deep_fake/screens/home/user_train.dart';
import 'package:deep_fake/screens/home/video_page.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deep_fake/screens/home/about.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  BottomNavBar({required this.currentIndex});

  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoListPage()),
        );

        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserTrain()),
        );
        break;
      case 4:
        // Navigate to the Video List Page when the Profile icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MorePage()),
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
        TabItem(icon: Icons.mic, title: 'Audio'),
        TabItem(icon: Icons.video_call_rounded, title: 'Video'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.person, title: 'User'),
        TabItem(icon: Icons.settings, title: 'More'),
      ],
      initialActiveIndex: currentIndex,
      onTap: (index) => _navigateToPage(index, context),
    );
  }
}
