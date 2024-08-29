import 'dart:convert';
import 'package:deep_fake/models/result.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;




class DeepFakeAnalysisPage extends StatefulWidget {
  @override
  _DeepFakeAnalysisPageState createState() => _DeepFakeAnalysisPageState();
}

class _DeepFakeAnalysisPageState extends State<DeepFakeAnalysisPage> {
  Future<DeepFakeAnalysis> fetchDeepFakeAnalysis() async {
  final response = await http.get(Uri.parse('https://your-api-endpoint.com/deepfake-analysis'));

  if (response.statusCode == 200) {
    return DeepFakeAnalysis.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load deep fake analysis');
  }
}
  late Future<DeepFakeAnalysis> futureAnalysis;

  @override
  void initState() {
    super.initState();
    futureAnalysis = fetchDeepFakeAnalysis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Fake Analysis'),
      ),
      body: FutureBuilder<DeepFakeAnalysis>(
        future: futureAnalysis,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final analysis = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                    ),
                    SizedBox(height: 8),
                    Text(
                      analysis.summary,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Inconsistencies Detected',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                    ),
                    SizedBox(height: 8),
                    for (var inconsistency in analysis.inconsistencies)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          inconsistency,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    SizedBox(height: 16),
                    Text(
                      'Technical Analysis',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                    ),
                    SizedBox(height: 8),
                    Text(
                      analysis.technicalAnalysis,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Probability Score',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${analysis.probabilityScore.toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // Implement PDF Download functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                      child: Text('Download PDF Report'),
                    ),
                    SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () {
                        // Implement Share Results functionality here
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blueAccent),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                      child: Text(
                        'Share Results',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
