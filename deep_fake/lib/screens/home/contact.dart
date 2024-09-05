import 'package:deep_fake/services/contact/contact_provider.dart';
import 'package:deep_fake/utils/snackbar_helper.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Subject'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the subject';
                  }
                  return null;
                },
                onSaved: (value) => subject = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Message'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
                onSaved: (value) => message = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitForm(context),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
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
