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
  // bool _isChecked = false;

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
    // final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            // image: Image.asset(name),
            gradient: LinearGradient(
          colors: [Color(0xFFFFE0B2), Color(0xFFE6E6FA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight - MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Center(
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
                            color: Colors.white),
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
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              validator: _validateEmailOrPhone,
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                fillColor: Colors.black,
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
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
                              foregroundColor: Colors.amber[700],
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
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
                      const SizedBox(height: 5.0),
                      const Text('Sign in with ',
                          style: TextStyle(
                              color: Color.fromRGBO(205, 118, 237, 1),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 10.0),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: 200,
                            height: 70,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 221, 193, 244),
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
                                        height: 40,
                                        width: 2,
                                        color: const Color.fromRGBO(
                                            50, 50, 50, 1)),
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
                          color: Color.fromRGBO(195, 195, 195, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.underline,
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
      ),
    );
  }
}
