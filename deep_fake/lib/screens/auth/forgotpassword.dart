import 'package:deep_fake/services/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deep_fake/screens/auth/resetpassword.dart';

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

  void getSecurityQuestion() async {
    final authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    final question =
        await authProvider.getSecurityQuestion(emailController.text);
    if (question != null) {
      setState(() {
        securityQuestion = question;
        showSecurityQuestion = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not found or error occurred.')),
      );
    }
  }

  void verifyAnswer() async {
    final authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    final success = await authProvider.verifySecurityAnswer(
        emailController.text, answerController.text);
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResetPassword(email: emailController.text)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect answer. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple[900],
      body: Container(
        height: 900,
        decoration: BoxDecoration(
              gradient:LinearGradient(
  colors: [Color(0xFFFFFFFF), Color(0xFFFFE0B2), Color(0xFFFAF9F6)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
)






          
            ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
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
            ),
          ),
        ),
      ),
    );
  }
}
