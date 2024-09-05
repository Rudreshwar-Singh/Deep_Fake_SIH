import 'package:deep_fake/services/contact/contact_provider.dart';
import 'package:deep_fake/utils/snackbar_helper.dart';
import 'package:deep_fake/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String subject = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color(0xFFFFD700), // Golden yellow for app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFE0B2),
              Color(0xFFE6E6FA)
            ], // Light yellow gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We\'d Love to Hear From You!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextFormField(
                      label: 'Name',
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your name' : null,
                      onSaved: (value) => name = value!,
                    ),
                    SizedBox(height: 10),
                    _buildTextFormField(
                      label: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter your email';
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                          return 'Please enter a valid email';
                        return null;
                      },
                      onSaved: (value) => email = value!,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    _buildTextFormField(
                      label: 'Subject',
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter the subject' : null,
                      onSaved: (value) => subject = value!,
                    ),
                    SizedBox(height: 10),
                    _buildTextFormField(
                      label: 'Message',
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your message' : null,
                      onSaved: (value) => message = value!,
                      maxLines: 5,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _submitForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFD700),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFFDAA520)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFD700), width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDAA520)),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final success = await Provider.of<ContactProvider>(context, listen: false)
          .submitContactForm(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );

      if (success) {
        showSuccessMessage(context, message: 'Form submitted successfully');
      } else {
        showErrorMessage(context, message: 'Failed to submit the form');
      }
    }
  }
}
