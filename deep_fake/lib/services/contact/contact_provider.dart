import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactProvider with ChangeNotifier {
  final String baseUrl = 'https://fakifybackend.onrender.com/api/contact';

  Future<bool> submitContactForm({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final url = Uri.parse('$baseUrl/submit');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'subject': subject,
          'message': message,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }
}
