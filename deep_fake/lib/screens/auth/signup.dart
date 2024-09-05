import 'package:deep_fake/screens/home/home.dart';
import 'package:deep_fake/services/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider>(context, listen: false);

    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
  colors: [Color(0xFFFFFFFF), Color(0xFFFFE0B2), Color(0xFFFAF9F6)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
)


        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          if (_selectedQuestion != null) {
                            final success = await authProvider.signUp(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              _selectedQuestion!,
                              answerController.text,
                            );
                            if (success) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Sign up failed. Please try again.'),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please select a security question.'),
                              ),
                            );
                          }
                        },
                        child: Text('Sign Up'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
