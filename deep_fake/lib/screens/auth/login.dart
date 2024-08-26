import 'package:deep_fake/screens/auth/signup.dart';
import 'package:deep_fake/screens/home/home.dart';
import 'package:deep_fake/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrPhoneController = TextEditingController();
  bool _isChecked = false;

  String? _validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or phone number';
    }

    // Regular expressions for validation
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
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
                      // child: Image.asset(
                      //   'images/moofli_logo.jpg', // Path to your logo
                      //   width: screenWidth * 0.25, // Adjust width as needed
                      //   height: screenHeight * 0.15, // Adjust height as needed
                      // ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Welcome!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          iconAlignment: IconAlignment.end,
                          onPressed: () {
                            // Add your password recovery logic here
                          },
                          style: TextButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(155, 0, 210, 1.0)
                              // This sets the text color
                              ),
                          child: const Text(
                            'Forgot your password?',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showSuccessMessage(context,
                              message: 'Log in Successful');
                          // If the form is valid, navigate to the signup page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  HomePage()),
                          );
                        } else {
                          // Show error message
                          showErrorMessage(context,
                              message:
                                  'Please enter a valid email or 10-digit phone number');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(155, 0, 210, 1.0)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Log in ',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)),
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
                                      height: 50, // Adjust height as needed
                                      width:
                                          2, // Set the thickness of the divider
                                      color:
                                          const Color.fromRGBO(50, 50, 50, 1)),
                                  Expanded(
                                    child: IconButton(
                                      icon: SizedBox(
                                        width: 34.0,
                                        height: 33.0,
                                        child: Image.asset(
                                            'images/facebook_logo.png'),
                                      ),
                                      onPressed: () {
                                        // Implement Facebook login functionality
                                      },
                                    ),
                                  ),
                                  Container(
                                      height: 50, // Adjust height as needed
                                      width:
                                          2, // Set the thickness of the divider
                                      color: const Color.fromRGBO(50, 50, 50,
                                          1)), // Divider between buttons
                                  Expanded(
                                    child: IconButton(
                                      icon: SizedBox(
                                        width: 40.0,
                                        height: 40.7,
                                        child: Image.asset(
                                            'images/2.png'),
                                      ),
                                      onPressed: () {
                                        // Implement Skillop login functionality
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
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CheckboxTheme(
                          data: const CheckboxThemeData(
                            side: BorderSide(
                                color: Color.fromRGBO(155, 0, 210, 1.0),
                                width: 2),
                          ),
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value ?? false;
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Do you want to know the news?',
                          style: TextStyle(
                              color: Color.fromRGBO(9, 9, 9, 1),
                              fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: '''By signing up or logging in, you agree to 
  our ''',
                        style: TextStyle(
                          color: Color.fromRGBO(106, 106, 106, 1),
                          fontSize: 16.0,
                          fontFamily: "Poppins",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of service',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              color: Color.fromRGBO(106, 106, 106, 1),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy policy',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ],
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
                             builder: (context) => Signuppg1()));
                        // Add your password recovery logic here
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromRGBO(155, 0, 210, 1.0)
                          // This sets the text color
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
