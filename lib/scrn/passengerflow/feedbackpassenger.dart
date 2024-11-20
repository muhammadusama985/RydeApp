import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lets_ryde/scrn/passengerflow/feedthanks.dart';

class PassengerFeedback extends StatefulWidget {
  const PassengerFeedback({super.key});

  @override
  State<PassengerFeedback> createState() => _PassengerFeedbackState();
}

class _PassengerFeedbackState extends State<PassengerFeedback> {
  final List<int> _selectedRatings1 = List.filled(1, 0); // Initialize with one rating
final List<int> _selectedRatings2 = List.filled(1, 0); // Initialize with one rating
final List<int> _selectedRatings3 = List.filled(1, 0); // Initialize with one rating
final List<int> _selectedRatings4 = List.filled(1, 0); // Initialize with one rating
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'), // Replace with your image path of driver
                fit: BoxFit.cover, // Adjust based on your need
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
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
                              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: const Text(
                                'Feedback',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Feedback for Driver',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Rate your experience of your ryde and your driver',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF848484),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F6F8),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assets/images/user_placeholder.png', // Replace with driver image
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Driver', // Replace with driver name
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                const Text(
                                  'How was your overall experience with this driver during your ryde?',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.black,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  '29 April 2022', // Replace with the actual date
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFCDCDCD),
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5),
                                        Text('Driving skills  ', style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                        SizedBox(height: 5),
                                          Text('Punctuality ', style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                        SizedBox(height: 5),
                                        Text('Communication  ', style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                        SizedBox(height:5),
                                         Text('Reliability       ', style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),

                                      ],
                                    ),
                                 Column(
                                      children: [
                                        Row(
                                          children: 
                                          
                                          List.generate(5, (starIndex1) {
                                            return SizedBox(
                                              height: 20,
                                              width: 15, // Adjust this value to reduce or increase spacing
                                              child: IconButton(
                                                icon: Icon(
                                                  starIndex1 < _selectedRatings1[0]
                                                      ? Icons.star
                                                      : Icons.star_border,
                                                  color: Colors.amber,
                                                  size: 14,
                                                ),
                                                hoverColor: Colors.transparent,
                                                onPressed: () {
                                                  setState(() {
                                                    _selectedRatings1[0] = starIndex1 + 1;
                                                  });
                                                },
                                              ),
                                            );
                                          }),
                                        ),
                                         
                                Row(
                                  children: 
                                  
                                  List.generate(5, (starIndex2) {
                                    return SizedBox(
                                      height: 20,
                                      width: 15, // Adjust this value to reduce or increase spacing
                                      child: IconButton(
                                        icon: Icon(
                                          starIndex2 < _selectedRatings2[0]
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: Colors.amber,
                                          size: 14,
                                        ),
                                        hoverColor: Colors.transparent,
                                        onPressed: () {
                                          setState(() {
                                            _selectedRatings2[0] = starIndex2 + 1;
                                          });
                                        },
                                      ),
                                    );
                                  }),
                                ),
                                Row(
                                  children: 
                                  
                                  List.generate(5, (starIndex3) {
                                    return SizedBox(
                                      height: 20,
                                      width: 15, // Adjust this value to reduce or increase spacing
                                      child: IconButton(
                                        icon: Icon(
                                          starIndex3 < _selectedRatings3[0]
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: Colors.amber,
                                          size: 14,
                                        ),
                                        hoverColor: Colors.transparent,
                                        onPressed: () {
                                          setState(() {
                                            _selectedRatings3[0] = starIndex3 + 1;
                                          });
                                        },
                                      ),
                                    );
                                  }),
                                ),
                                Row(
                                  children: 
                                  
                                  List.generate(5, (starIndex4) {
                                    return SizedBox(
                                      height: 25,
                                      width: 15, // Adjust this value to reduce or increase spacing
                                      child: IconButton(
                                        icon: Icon(
                                          starIndex4 < _selectedRatings4[0]
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: Colors.amber,
                                          size: 14,
                                        ),
                                        hoverColor: Colors.transparent,
                                        onPressed: () {
                                          setState(() {
                                            _selectedRatings4[0] = starIndex4 + 1;
                                          });
                                        },
                                      ),
                                    );
                                  }),
                                ),
                                

                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  height: 40,
                                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                  child: const TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      fillColor: Color.fromARGB(255, 226, 232, 233),
                                      filled: true,
                                      hintText: ' Leave a review (optional)',
                                      hintStyle: TextStyle(
                                        color: Color(0xFFCDCDCD),
                                        fontSize: 12,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color.fromARGB(255, 226, 232, 233)),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color.fromARGB(255, 226, 232, 233)),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(0)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(50, 30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7),
                                          side: const BorderSide(
                                            color: Color(0xFFCDCDCD),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Ignore',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(21, 185, 135, 1),
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const Feedthanks()));
                                      },
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(50, 30),
                                        backgroundColor: const Color.fromRGBO(21, 185, 135, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7),
                                        ),
                                      ),
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
