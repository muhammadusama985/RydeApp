import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_ryde/scrn/signupscreens/sign_in.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  const Image(
                    height: 100,
                    image: AssetImage('assets/images/logoletsryde.png'),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(21, 185, 135, 1),
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "To create an account, please enter \n your mobile number",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 34),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly 
                      ],
                      decoration: const InputDecoration(
                        fillColor: Color(0xFFF6F6F8),
                        filled: true,
                        hintText: '   Enter your number here...',
                        hintStyle: TextStyle(
                          color: Color(0xFFCDCDCD),
                          fontSize: 13,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w100,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                    height: 56,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                         showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/otp.png', 
                                  height: 200,
                                ),
                                const SizedBox(height: 30),
                               
                                const Text(
                                  'We have sent a verification code to your phone number.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 40,
                                  width: screenWidth,
                                  child: ElevatedButton(
                                    onPressed: () {
                                    
                                  },
                                    style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    const Color.fromRGBO(21, 185, 135, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 44, vertical: 10),
                                    ),
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Urbanist',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  
                                  ),
                                ),
                                const SizedBox(height: 2)
                               
                                
                              ],
                            ),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(21, 185, 135, 1)),
                            
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Urbanist', 
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=> const UserSignIn()));
                      
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 15,
                            color: Color.fromRGBO(21, 185, 135, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'By registering, I agree with the privacy policy, as well as the terms and conditions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF848484),
                    ),
                  ),
                  
                  const Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const TextButton(
                    
                    onPressed: null,
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(27, 94, 32, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
