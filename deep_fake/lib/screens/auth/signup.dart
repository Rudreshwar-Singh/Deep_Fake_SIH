import 'package:deep_fake/screens/home/home.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _selectedQuestion;
  final emailController = TextEditingController();
   final nameController = TextEditingController();
    final passwordController = TextEditingController();
     final answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.purple[200],
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(                 
                  hintText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select a security question',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                value: _selectedQuestion,
                items: [
                  DropdownMenuItem(
                    child: Text('What is your mother\'s name?'),
                    value: 'mother',
                  ),
                  DropdownMenuItem(
                    child: Text('What was your first pet\'s name?'),
                    value: 'pet',
                  ),
                  DropdownMenuItem(
                    child: Text('What was the model of your first car?'),
                    value: 'car',
                  ),
                  DropdownMenuItem(
                    child: Text('Where did you go to high school?'),
                    value: 'school',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedQuestion = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: answerController,
                decoration: InputDecoration(
                  hintText: 'Answer',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
