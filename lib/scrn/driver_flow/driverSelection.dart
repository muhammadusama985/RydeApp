import 'package:flutter/material.dart';
import 'package:lets_ryde/scrn/driver_flow/offerryde.dart';
import 'package:lets_ryde/scrn/signupscreens/sign_in.dart';

class Driverselection extends StatefulWidget {
  const Driverselection({super.key});

  @override
  State<Driverselection> createState() => _DriverselectionState();
}

class _DriverselectionState extends State<Driverselection> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return MaterialApp(
      home:   Scaffold(
        backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          child:  Center(
            child: Column(
              children: [
                const SizedBox(height : 40),
                const Image(
                  height: 247,
                  image: AssetImage('assets/images/logoletsryde.png'),
                ),
                
                const Spacer(),
                const Text("Travel long distance in a Car pool",style: TextStyle(
                  fontFamily: 'Urbanist',fontWeight: FontWeight.w600
                ),),
                 const Spacer(flex: 2),
                Container(
                  height: 56,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const OfferRyde()),
                    );
                  }, 
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(const Color.fromRGBO(21, 185,135, 1))
                  ),
                  child: const Text("Offer Your Own Ride",
                  style: TextStyle(fontSize: 17, color: Colors.white,fontFamily: 'Urbanist',fontWeight: FontWeight.bold),
                  )
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 56,
                  width: screenWidth,
                  decoration: BoxDecoration(
               
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromRGBO(21, 185,135, 1),
                    )
                  ),
                  child: ElevatedButton(
                    
                    onPressed: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context)=> const UserSignIn()));
                    }, 
                  child:  const Text("Passenger's Ride",
                  style: TextStyle(fontFamily: 'Urbanist',fontWeight: FontWeight.bold,fontSize: 17, color: Color.fromRGBO(21, 185,135, 1)),
                  )
                  ),
                ),
                   const Spacer(flex: 5),
                  
                  const Text('Terms and Conditions',
                  style: TextStyle(fontSize: 12, color: Colors.black,fontFamily: 'Urbanist',fontWeight: FontWeight.bold),
        
                  ),
                  const TextButton(onPressed: null, 
                  child:  Text('Privacy Policy',
                  style: TextStyle(
                    fontSize: 12,
                    color:  Color.fromRGBO(21, 185,135, 1),
                  fontFamily: 'Urbanist',fontWeight: FontWeight.bold
                  ),))
            
              ],
            ),
          ),
        ),
      ),
          ));
  }
}
