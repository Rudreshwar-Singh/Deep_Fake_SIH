import 'package:deep_fake/screens/auth/login.dart';
import 'package:flutter/material.dart';
class ResetPassword extends StatefulWidget {
   final String email;

  ResetPassword({required this.email});
   @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
 
  final TextEditingController newPasswordController = TextEditingController();

  

  void resetPassword(BuildContext context) {
    // Simulate an API call to reset the password
    // Replace this with your actual API call
    print('New Password: ${newPasswordController.text}');
    // Navigate to the login page after successful password reset
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login_Page()),
    );
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
              'Reset Password',
              style: TextStyle(fontSize: 24.0, color: Colors.purpleAccent),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: widget.email,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: newPasswordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Reset Password'),
              onPressed: () => resetPassword(context),
            ),
          ],
        ),
      ),
    );
  }
}