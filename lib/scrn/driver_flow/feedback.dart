import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lets_ryde/scrn/constants.dart' as globals;

class DriverFeedback extends StatefulWidget {
  const DriverFeedback({super.key});

  @override
  State<DriverFeedback> createState() => _DriverFeedbackState();
}

class _DriverFeedbackState extends State<DriverFeedback> {
  List<int> _selectedRatings = [];

  @override
  void initState() {
    super.initState();
    // Initialize the ratings list only if globals.passengers is valid
    if (globals.passengers > 0) {
      _selectedRatings = List<int>.filled(globals.passengers, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
           Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'), // Replace with your image path
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
                        'Feedback for Passenger',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Rate your experience of passenger of your ride',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF848484),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      globals.passengers > 0
                          ? ListView.builder(
                            shrinkWrap: true, // Allow ListView to take minimum space
                            physics: const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                            itemCount: globals.passengers, // Replace with dynamic count
                            itemBuilder: (context, index) {
                              return Container(
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
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 20,
                                          backgroundImage: AssetImage(
                                            'assets/images/user_placeholder.png', // Replace with passenger image
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                         Text(
                                                'Passenger ${index + 1}', // Replace with passenger name
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ]       
                                    ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Leave a review for the Passenger of your ride',
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
                                        
                                            // 5 Star Rating
                                            Row(
                                            children: List.generate(5, (starIndex) {
                                              return SizedBox(
                                                height: 25,
                                                width: 20, // Adjust this value to reduce or increase spacing
                                                child: IconButton(
                                                  icon: Icon(
                                                    starIndex < _selectedRatings[index]
                                                        ? Icons.star
                                                        : Icons.star_border,
                                                    color: Colors.amber,
                                                 size: 14,
                                                  ),
                                                 
                                                            
                                                  hoverColor: Colors.transparent,
                                                  onPressed: () {
                                                    setState(() {
                                                      _selectedRatings[index] = starIndex + 1;
                                                    });
                                                  },
                                                ),
                                              );
                                            }),
                                          ),
                                          
                                          
                                          Container(
                                            height: 37,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              minimumSize: const Size(50, 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
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
                                              
                                            },
                                            style: TextButton.styleFrom(
                                              minimumSize: const Size(50, 30),
                                              backgroundColor:
                                                  const Color.fromRGBO(21, 185, 135, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
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
                              );
                            },
                          )
                          : const Text(
                              'No passengers available to rate.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
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
