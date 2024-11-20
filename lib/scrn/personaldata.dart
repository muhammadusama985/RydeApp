
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lets_ryde/scrn/profilepic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Personalinfo extends StatefulWidget {
  const Personalinfo({super.key});

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  late TextEditingController dateController;
  DateTime? selectedDate;
  String? selectedGender;

  // Controllers for Full Name and Email
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    dateController = TextEditingController();
  }

  @override
  void dispose() {
    dateController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  // Method to store user data in Firestore
  Future<void> _storeUserData() async {
    // Retrieve current user
    User? user = _auth.currentUser;

    if (user != null) {
      String uid = user.uid;

      // Prepare data to store
      Map<String, dynamic> userData = {
        'fullName': fullNameController.text.trim(),
        'email': emailController.text.trim(),
        'gender': selectedGender,
        'birthday': selectedDate != null
            ? Timestamp.fromDate(selectedDate!)
            : null, // Store as Timestamp
        'phoneNumber': user.phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
        'uid': user.uid,

        // Add other fields if necessary
      };

      try {
        // Store data in 'passengerPersonalInfo' collection with UID as document ID
        await _firestore
            .collection('passengerPersonalInfo')
            .doc(uid)
            .set(userData, SetOptions(merge: true));

print('User data stored successfully for UID: $uid');

        // Show success dialog
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
                  'assets/images/success.png',
                  height: 90,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Registration Successful',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'You are now registered.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profilepic(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(21, 185, 135, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } catch (e) {
        // Handle Firestore errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save data: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // Handle case when user is not logged in
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No authenticated user found.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView( // Prevent overflow on smaller screens
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(5, 22, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/images/backarrow.svg',
                              height: 15,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                          child: const Text(
                            'Personal Data',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30), // Replaced Spacer(flex: 3)
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full Name Field
                        const Text(
                          '  Full Name',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 52,
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                          child: TextFormField(
                            controller: fullNameController, // Added Controller
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              fillColor: Color(0xFFF6F6F8),
                              filled: true,
                              hintText: ' Enter Full Name',
                              hintStyle: TextStyle(
                                color: Color(0xFFCDCDCD),
                                fontSize: 13,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 33),
                        // Email Field
                        const Text(
                          '  Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 52,
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                          child: TextFormField(
                            controller: emailController, // Added Controller
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              fillColor: Color(0xFFF6F6F8),
                              filled: true,
                              hintText: ' Enter your email',
                              hintStyle: TextStyle(
                                color: Color(0xFFCDCDCD),
                                fontSize: 13,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 33),
                        // Gender Field
                        const Text(
                          '  Gender',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 52,
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                          child: DropdownButtonFormField<String>(
                            iconSize: 22,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFFCDCDCD),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: const InputDecoration(
                              fillColor: Color(0xFFF6F6F8),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                            hint: const Text(
                              ' Select your gender',
                              style: TextStyle(
                                color: Color(0xFFCDCDCD),
                                fontSize: 13,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: selectedGender,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue;
                              });
                            },
                            items: <String>[
                              'Male',
                              'Female',
                              'Rather not say'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Birthday Field
                        const Text(
                          '  Birthday',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 52,
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                            controller: dateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              fillColor: const Color(0xFFF6F6F8),
                              filled: true,
                              hintText: selectedDate == null
                                  ? ' Enter your birthday'
                                  : DateFormat('EEEE, MMMM dd, yyyy')
                                      .format(selectedDate!),
                              hintStyle: const TextStyle(
                                color: Color(0xFFCDCDCD),
                                fontSize: 13,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              suffixIcon: IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.calendar_month),
                                color: const Color(0xFFCDCDCD),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: Color.fromRGBO(
                                                21, 185, 135, 1), // header background color
                                            onPrimary:
                                                Colors.white, // header text color
                                            onSurface: Color.fromRGBO(
                                                21, 185, 135, 1), // body text color
                                          ),
                                          dialogBackgroundColor: Colors.white,
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (pickedDate != null) {
                                    setState(() {
                                      selectedDate = pickedDate;
                                      dateController.text = DateFormat(
                                              'EEEE, MMMM dd, yyyy')
                                          .format(pickedDate);
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40), // Replaced Spacer(flex: 4)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 56,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Store data in Firestore
                        await _storeUserData();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(21, 185, 135, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Replaced Spacer(flex: 5)
                  const Align(
                    heightFactor: 0,
                    alignment: Alignment.center,
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          color: Color.fromRGBO(27, 94, 32, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Replaced Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
