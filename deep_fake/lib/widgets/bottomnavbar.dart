import 'package:deep_fake/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:deep_fake/screens/home/home_page.dart';
import 'package:deep_fake/screens/home/about.dart';
// Import other pages

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
        // Handle the Add page or open a dialog, for example
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Add Page'),
            content: Text('This is the Add page functionality'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          ),
        );
        break;
      case 3:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => ContactPage()),
        // );
        break;
      case 4:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => ProfilePage()),
        // );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.collections, title: 'Collection'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.chat, title: 'Contact'),
        TabItem(icon: Icons.person, title: 'Profile'),
      ],
      initialActiveIndex: currentIndex,
      onTap: (index) => _navigateToPage(index, context),
    );
  }
}
