import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Signuppg1 extends StatefulWidget {
  const Signuppg1({super.key});

  @override
  State<Signuppg1> createState() => _Signuppg1State();
}

class _Signuppg1State extends State<Signuppg1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SIGN UP',style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0,0),
              decoration: TextDecoration.underline,
            ),
            ),
            SizedBox(height: 25.0),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 25.0),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility),
                    hintText: 'Re-enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileCompletionScreen()));
                    },
                    child: Text('Sign Up')
                    ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            // Google Sign In Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: Image.network(
                'https://developers.google.com/identity/images/g-logo.png', // Replace with your Google logo URL
                height: 24.0,
              ),
              label: Text('Login with Google'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

          ],
        ),
      ),
      
    );
  }
}