import 'package:deep_fake/screens/auth/forgotpassword.dart';
import 'package:deep_fake/screens/auth/signup.dart';
import 'package:deep_fake/screens/home/home.dart';
import 'package:deep_fake/services/auth/auth_provider.dart';
import 'package:deep_fake/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isChecked = false;

  String? _validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or phone number';
    }

    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    final RegExp phoneRegex = RegExp(r'^\d{10}$');

    if (emailRegex.hasMatch(value) || phoneRegex.hasMatch(value)) {
      return null;
    }

    return 'Please enter a valid email or 10-digit phone number';
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
         decoration: BoxDecoration(
          // image: Image.asset(name),
          gradient: LinearGradient(
            colors: [
              Color(0xFF800080), // Start color (Purple)
              Color(0xFF4B0082), // End color (Indigo Purple)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight - MediaQuery.of(context).padding.top,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        // child: Image.asset('images/moofli_logo.jpg'),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Welcome!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailOrPhoneController,
                              decoration: const InputDecoration(
                                labelText: 'Email or phone number',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              validator: _validateEmailOrPhone,
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Forgotpassword()));
                            },
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(155, 0, 210, 1.0),
                            ),
                            child: const Text(
                              'Forgot your password?',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool success = await Provider.of<MyAuthProvider>(
                                    context,
                                    listen: false)
                                .login(_emailOrPhoneController.text,
                                    _passwordController.text);
        
                            if (success) {
                              showSuccessMessage(context,
                                  message: 'Log in Successful');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            } else {
                              showErrorMessage(context,
                                  message: 'Login Failed. Please try again.');
                            }
                          } else {
                            showErrorMessage(context,
                                message:
                                    'Please enter a valid email or 10-digit phone number');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(155, 0, 210, 1.0)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'OR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Sign in with ',
                          style: TextStyle(
                              color: Color.fromRGBO(155, 0, 210, 1.0),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 10.0),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: 340,
                            height: 73,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(241, 244, 255, 1),
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        icon: SizedBox(
                                          width: 37.0,
                                          height: 37.0,
                                          child: Image.asset(
                                              'images/google_logo.png'),
                                        ),
                                        onPressed: () {
                                          // Implement Google login functionality
                                        },
                                      ),
                                    ),
                                    Container(
                                        height: 50,
                                        width: 2,
                                        color:
                                            const Color.fromRGBO(50, 50, 50, 1)),
                                    Expanded(
                                      child: IconButton(
                                        icon: SizedBox(
                                          width: 37.0,
                                          height: 37.0,
                                          child: Image.asset(
                                              'images/facebook_logo.png'),
                                        ),
                                        onPressed: () {
                                          // Implement Facebook login functionality
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Don\'t have an account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color.fromRGBO(106, 106, 106, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(155, 0, 210, 1.0),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: "Poppins",
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
    );
  }
}
