import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_ryde/scrn/passengerflow/searchryde.dart';
import 'package:lets_ryde/scrn/signupscreens/sign_up.dart';

// ignore: must_be_immutable
class Otp extends StatefulWidget {
   Otp({super.key, required this.verificationId});
  String verificationId;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  bool isLoading = false; // To show loading indicator

  @override
  void dispose() {
    // Dispose controllers to free up resources.
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String getOtpFromControllers() {
    return _otpControllers.map((controller) => controller.text).join();
  }

 Future<void> verifyOtp() async {
  setState(() {
    isLoading = true;
  });

  try {
    final otpCode = getOtpFromControllers(); // Get combined OTP
    final cred = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otpCode,
    );

    // Sign in the user with the credential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(cred);

    if (userCredential.user != null) {
      String uid = userCredential.user!.uid;
      String? phoneNumber = userCredential.user!.phoneNumber;
      Timestamp createdAt = Timestamp.now(); // Current date and time

      // Storing user data in Firestore
      await FirebaseFirestore.instance.collection('VerifiedUsers').doc(uid).set({
        'phone': phoneNumber,
        'createdAt': createdAt,
        'userId': uid,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number verified and stored successfully in Firestore.')),
      );

      // Navigate to next screen or do something after successful verification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SearchRyde()),
      );
    } else {
      log('User is null. Verification failed.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User is null. Please try again.')),
      );
    }
  } on FirebaseAuthException catch (e) {
    log('FirebaseAuthException: ${e.message}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.message ?? 'Authentication failed')),
    );
  } catch (e) {
    log('Exception during Firestore storage: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('An error occurred. Please try again.')),
    );
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView( // Added to prevent overflow on smaller screens
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromRGBO(21, 185, 135, 1),
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth,
                  child: const Text(
                    'Please enter the verification code that we have sent to your phone',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      color: Color(0xFF808D9E),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 49,
                        height: 56,
                        child: TextFormField(
                          controller: _otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xFF15B987),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist',
                              fontSize: 20),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(21, 185, 135, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFEDF1F8),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.length == 1 && index < 5) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    // Replace with your phone number and resend logic
                    String phoneNumber = 'YOUR_PHONE_NUMBER';

                    setState(() {
                      isLoading = true;
                    });

                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneNumber,
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        // Auto-retrieval or instant verification
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        log('Verification failed: ${e.message}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text(e.message ?? 'Verification failed')),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        // Update the verificationId
                        setState(() {
                          widget.verificationId = verificationId;
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Verification code resent')),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        // Auto-retrieval timeout
                        setState(() {
                          widget.verificationId = verificationId;
                          isLoading = false;
                        });
                      },
                    );
                  },
                  child: const Center(
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                        color: Color.fromRGBO(21, 185, 135, 1),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: screenWidth,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: verifyOtp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(21, 185, 135, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                            ),
                            child: const Text(
                              "Verify & Continue",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 1),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          color: Color(0xFF808D9E),
                          fontSize: 14,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold),
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
