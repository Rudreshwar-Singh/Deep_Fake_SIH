import 'package:deep_fake/screens/auth/login.dart';
import 'package:deep_fake/services/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  final String email;

  ResetPassword({required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  bool _isLoading = false;

  void resetPassword(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    final authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    bool success = await authProvider.resetPassword(
        widget.email, newPasswordController.text);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login_Page()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to reset password. Please try again.'),
          backgroundColor: Colors.red,
        ),
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
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    child: Text('Reset Password'),
                    onPressed: () => resetPassword(context),
                  ),
          ],
        ),
      ),
    );
  }
}
