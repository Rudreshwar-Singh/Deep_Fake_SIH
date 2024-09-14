import 'package:flutter/material.dart';

class HowItWorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How It Works'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFE6E6FA), Color(0xFFFFE0B2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'How It Works',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Our deep fake detection technology employs a multi-faceted approach to identify and authenticate face-swap deep fake videos. Here’s a breakdown of how our system works:',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 32),
                _buildSection(
                  context,
                  number: '1.',
                  title: 'Convolutional Neural Networks (CNNs)',
                  description:
                      'We use CNNs to analyze facial features, expressions, and movements. By examining each video frame, our system detects inconsistencies and unnatural transitions that may indicate the presence of a deep fake.',
                ),
                SizedBox(height: 16),
                _buildSection(
                  context,
                  number: '2.',
                  title:
                      'Recurrent Neural Networks (RNNs) and Long Short-Term Memory (LSTM) Networks',
                  description:
                      'RNNs and LSTMs are employed to analyze the temporal sequence of video frames. This helps us identify anomalies and inconsistencies over time, enhancing our ability to detect sophisticated deep fakes that might exhibit subtle temporal irregularities.',
                ),
                SizedBox(height: 16),
                _buildSection(
                  context,
                  number: '3.',
                  title: 'Capsule Networks',
                  description:
                      'Capsule Networks help us better capture spatial hierarchies between features in the video. This adds another layer of robustness in detecting deep fakes by understanding the relationships between different facial features in a more detailed manner.',
                ),
                SizedBox(height: 16),
                _buildSection(
                  context,
                  number: '4.',
                  title: 'Adversarial Training',
                  description:
                      'Adversarial training involves using Generative Adversarial Networks (GANs) to produce deep fakes and train our detection models simultaneously. This method improves the robustness of our algorithms by exposing them to a variety of deep fake techniques and counteracting them effectively.',
                ),
                SizedBox(height: 16),
                _buildSection(
                  context,
                  number: '5.',
                  title: 'Audio-Visual Inconsistencies',
                  description:
                      'By integrating audio analysis with visual analysis, we can detect mismatches between lip movements and speech, as well as inconsistencies in ambient sounds. This multi-modal approach enhances our ability to identify deep fakes that may not be apparent through visual analysis alone.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String number,
      required String title,
      required String description}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number $title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
