import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoUploadService with ChangeNotifier {
  bool _isLoading = false;
  String? _report;
  double? _probabilityScore;

  bool get isLoading => _isLoading;
  String? get report => _report;
  double? get probabilityScore => _probabilityScore;

  Future<void> uploadVideo(String filePath, String analysisType) async {
    _isLoading = true;
    notifyListeners();

    final uri = Uri.parse('https://fakifybackend.onrender.com/api');
    final request = http.MultipartRequest('POST', uri)
      ..fields['analysisType'] = analysisType
      ..files.add(await http.MultipartFile.fromPath('video', filePath));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(responseBody);
      _report = jsonResponse['report'];
      _probabilityScore = jsonResponse['probabilityScore'].toDouble();
    } else {
      _report = null;
      _probabilityScore = null;
      throw Exception('Failed to upload video');
    }

    _isLoading = false;
    notifyListeners();
  }
}
