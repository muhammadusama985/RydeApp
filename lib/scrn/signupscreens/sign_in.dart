import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_ryde/scrn/signupscreens/verification_code.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  bool _rememberMe = false;

  // Adding the phoneController for capturing the phone number
  final phoneController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Image(
                  height: 118,
                  image: AssetImage('assets/images/logoletsryde.png'),
                ),
                const SizedBox(height: 29),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 39,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(21, 185, 135, 1),
                    fontFamily: 'Urbanist',
                  ),
                ),
              
                const SizedBox(height: 28),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: 
                  // TextFormField(
                  //   keyboardType: TextInputType.phone,
                  //   controller: phoneController, // Add controller
                  
                  //   decoration: const InputDecoration(
                  //     fillColor: Color(0xFFF6F6F8),
                  //     filled: true,
                  //     hintText: ' Enter your mobile no to continue',
                  //     hintStyle: TextStyle(
                  //       color: Color(0xFFCDCDCD),
                  //       fontSize: 13,
                  //       fontFamily: 'Urbanist',
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     ),
                  //   ),
                  // ),

                  TextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.25),
                  filled: true,
                  hintText: "Enter Phone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none)),
            ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Row(children: [
                      Transform.scale(
                        scale: 0.6,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          activeColor:
                              const Color.fromRGBO(21, 185, 135, 1),
                        ),
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFCDCDCD),
                        ),
                      ),
                    ])),
                const SizedBox(height: 40),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  height: 56,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: isloading
                      ? const CircularProgressIndicator() // Show loader while verifying
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isloading = true;
                            });

                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phoneController.text,
                              verificationCompleted: (phoneAuthCredential) {},
                              verificationFailed: (error) {
                                log(error.toString());
                                setState(() {
                                  isloading = false;
                                });
                              },
                              codeSent:
                                  (verificationId, forceResendingToken) {
                                setState(() {
                                  isloading = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Otp(
                                            verificationId: verificationId,
                                          )),
                                );
                              },
                              codeAutoRetrievalTimeout: (verificationId) {
                                log("Auto Retrieval timeout");
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(21, 185, 135, 1)),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                ),
              
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
