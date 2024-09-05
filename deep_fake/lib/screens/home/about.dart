import 'package:deep_fake/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';



class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text('About Us'),
      //   backgroundColor: Colors.black,
      // ),
      body: Container(
        decoration: BoxDecoration(
              gradient:LinearGradient(
  colors: [Color(0xFFFFFFFF), Color(0xFFE6E6FA), Color(0xFFFFE0B2)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
)





          
            ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10,right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "In today's digital age, the proliferation of synthetically-generated media, particularly deep fakes, poses significant challenges. Deep fakes, which leverage advanced AI and ML techniques to manipulate audio and video content, can undermine trust, commit fraud, spread disinformation, and even defame individuals. Addressing these challenges requires innovative solutions that combine the latest advancements in technology with rigorous forensic techniques.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Our Mission',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Our mission is to develop a robust AI/ML-based solution for authenticating face-swap deep fake videos. By leveraging state-of-the-art technologies and methodologies, we aim to provide a comprehensive tool that not only identifies deep fakes but also offers detailed insights into their creation and underlying techniques. Our solution is designed to help security agencies, media organizations, and individuals combat the growing threat of deep fakes and ensure the authenticity of digital content.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Our Approach',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "We utilize a combination of advanced neural networks and machine learning techniques to analyze visual data and improve detection capabilities.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Capsule Networks',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Capsule networks are used to better understand spatial hierarchies in visual data, enhancing the accuracy of our deep fake detection models.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Adversarial Training',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Adversarial training helps our models become more resilient to attempts at evasion, ensuring robust detection of even the most sophisticated deep fakes.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Our Visual Approach',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Our visual approach leverages cutting-edge techniques to analyze and authenticate digital content, providing detailed insights into the creation and manipulation of media.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
