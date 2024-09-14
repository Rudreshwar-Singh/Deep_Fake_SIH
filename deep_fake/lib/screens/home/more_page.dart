import 'package:deep_fake/screens/home/about.dart';
import 'package:deep_fake/screens/home/contact.dart';
import 'package:deep_fake/screens/home/howitwork.dart';
import 'package:deep_fake/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More options"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (AboutUsPage())),
                );
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 252, 247, 207),
                  elevation: 4,
                  textStyle: TextStyle(fontSize: 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 18,
                  )),
              child: Text("Read More"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (HowItWorksPage())),
                );
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 252, 247, 207),
                  elevation: 4,
                  textStyle: TextStyle(fontSize: 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 18,
                  )),
              child: Text("How it works"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (ContactUsPage())),
                );
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 252, 247, 207),
                  elevation: 4,
                  textStyle: TextStyle(fontSize: 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 18,
                  )),
              child: Text("Contact us"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
      ),
    );
  }
}
