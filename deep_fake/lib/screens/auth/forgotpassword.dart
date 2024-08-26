import 'package:deep_fake/screens/auth/resetpassword.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  String securityQuestion = '';
  bool showSecurityQuestion = false;

  void getSecurityQuestion() {
    // Simulate an API call to fetch the security question
    setState(() {
      securityQuestion = "What was your first pet's name?";
      showSecurityQuestion = true;
    });
  }

  void verifyAnswer() {
    // Simulate an API call to verify the answer
    if (answerController.text == "correctAnswer") {
      Navigator.push(
        context,
       MaterialPageRoute(builder: (context) => ResetPassword(email: emailController.text)),
      );
    } else {
      // Show an error message if the answer is incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect answer. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Forgot Password',
              style: TextStyle(fontSize: 24.0, color: Colors.purpleAccent),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Get Security Question'),
              onPressed: getSecurityQuestion,
            ),
            if (showSecurityQuestion) ...[
              SizedBox(height: 20.0),
              Text(
                securityQuestion,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: answerController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Answer',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Verify Answer'),
                onPressed: verifyAnswer,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

