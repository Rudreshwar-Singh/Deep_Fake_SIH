import 'package:deep_fake/screens/auth/login.dart';
import 'package:deep_fake/screens/auth/signup.dart';
import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // image: Image.asset(name),
          gradient: LinearGradient(
  colors: [Color(0xFFFFE0B2), Color(0xFFFFFFE0)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
)

 

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      Text("DeFake.ai",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'japanese',
                              fontSize: 60,
                              color: Colors.orange),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 300,
                    child: Row(
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Image.asset(
                            'images/logo.jpg',
                             height: 1000,
                             width: 300,
                           ),
                        ),
                    ],
                    ),
                  ),
                  SizedBox(height: 10,),
                 
                  // SizedBox(
                  //   height: 100,
                  // ),
                  // Text("Unmask the Fake, ",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 40,
                  //         color: Color.fromARGB(255, 122, 181, 223))),
                  // const Text("Trust the Real",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w900,
                  //       fontSize: 45,
                  //       color: Color.fromARGB(255, 156, 120, 238),
                  //       fontStyle: FontStyle.italic,
                  //       letterSpacing: 2,
                  //     )),
                  // // progress bar
                  // // Align(
                  // //   alignment: Alignment(-0.55, 0),
                  // //   child: Container(
                  // //     width: 138,
                  // //     height: 4,
                  // //     decoration:const BoxDecoration(
                  // //       gradient: LinearGradient(
                  // //         colors: [
                  // //           Color(0xFF108CFF),
                  // //           Color(0xFF0EAB00),
                  // //           Color(0xFFFFB800),
                  // //           Color(0xFFFD0C0C)
                  // //         ],
                  // //       ),
                  // //     ),
                  // //   ),
                  // // ),
                  // SizedBox(height: 60,),
                  // Text("Try Now",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 40,
                  //         color: Colors.purple[600])),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Text("We protect authenticity. ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          fontFamily: "InstrumentSer",
                          color:  Color.fromARGB(255, 226, 38, 207))),
                  Text("Safeguard your digital truth",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "InstrumentSer",
                          fontSize: 30,
                          color: Color.fromARGB(255, 226, 38, 207))),

                  SizedBox(height: 80),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Page()));
                      },
                      child: Text(
                        'Try now',
                         style: TextStyle(
                        //     fontFamily: "InstrumentSer",
                        //     fontSize: 28,
                             color: Colors.yellow[900],
                        //     fontWeight: FontWeight.bold),
                      ),),)
                  // Log In button
                  // Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     Container(
                  //       width: 208,
                  //       height: 51,
                  //       decoration: BoxDecoration(
                  //         gradient: const LinearGradient(
                  //           colors: [
                  //             Color(0xFFF42E2E),
                  //             Color.fromARGB(255, 255, 0, 217),
                  //             Color.fromARGB(255, 54, 0, 171),
                  //             Color(0xFF25CED1)
                  //           ],
                  //           begin: Alignment.topLeft,
                  //           end: Alignment.bottomRight,
                  //         ),
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       padding: EdgeInsets.all(3),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(10),
                  //         child: Container(
                  //           color: Colors.white,
                  //           child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               elevation: 0,
                  //               backgroundColor: Colors.transparent,
                  //               shape: const RoundedRectangleBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(10)),
                  //               ),
                  //             ),
                  //             onPressed: () {
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => Login_Page()),
                  //               );
                  //             },
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(
                  //                   top: 14, bottom: 14, left: 30, right: 30),
                  //               child: ShaderMask(
                  //                 shaderCallback: (Rect bounds) {
                  //                   return const LinearGradient(
                  //                     colors: [
                  //                       Color(0xFFF42E2E),
                  //                       Color.fromARGB(255, 0, 60, 255),
                  //                       Color.fromARGB(255, 171, 0, 148),
                  //                       Color(0xFF25CED1)
                  //                     ],
                  //                     begin: Alignment.topLeft,
                  //                     end: Alignment.bottomRight,
                  //                   ).createShader(bounds);
                  //                 },
                  //                 child: Text(
                  //                   "Log In",
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // sign up button
                  // Container(
                  //   width: 208,
                  //   height: 51,
                  //   child: ElevatedButton(
                  //     style: (ElevatedButton.styleFrom(
                  //       elevation: 0,
                  //       side: const BorderSide(
                  //           style: BorderStyle.solid, width: 2),
                  //       shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(10)),
                  //       ),
                  //       backgroundColor: Colors.white,
                  //       textStyle: TextStyle(color: Colors.black),
                  //     )),
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => SignUpPage()));
                  //     },
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(
                  //           top: 14, bottom: 14, left: 25, right: 25),
                  //       child: Text(
                  //         "Sign Up",
                  //         style: TextStyle(color: Colors.black),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
