import 'package:flutter/material.dart';
import 'package:lets_ryde/scrn/splash.dart';

class PaymentRequest extends StatefulWidget {
  const PaymentRequest({super.key});

  @override
  State<PaymentRequest> createState() => _PaymentRequestState();
}

class _PaymentRequestState extends State<PaymentRequest> {
  // Function to show logout confirmation dialog
  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevent dismiss by tapping outside the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you really want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (e)=>OfferRideSplash()));// Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
              children: [
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(5, 15, 0, 40),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 40),
                        child: const Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Logout button added here
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _showLogoutDialog(context), // Show logout dialog
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 15, 5, 40),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Requests Notify',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Accept or decline the passenger requests for the ride',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF848484),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Request Cards
                      ListView.builder(
                        shrinkWrap: true, // Allow ListView to take minimum space
                        physics: const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                        itemCount: 3 , // Replace with dynamic count
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
                                const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                        'assets/images/user_placeholder.png', // Replace with actual image
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Brandy Murphy wants to book 1 seat by Momo Pay of 32 GHC',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '29 April 2022',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFFCDCDCD),
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
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
                                        'No',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(21, 185, 135, 1),
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w600,
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
                                        'Yes',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      // Accept/Reject Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(21, 185, 135, 1),
                              minimumSize: Size(screenWidth * 0.4, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Accept all',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(screenWidth * 0.4, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              side: const BorderSide(
                                color: Color.fromRGBO(21, 185, 135, 1),
                              ),
                            ),
                            child: const Text(
                              'Reject all',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(21, 185, 135, 1),
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
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
