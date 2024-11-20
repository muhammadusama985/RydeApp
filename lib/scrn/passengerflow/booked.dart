import 'package:flutter/material.dart';
import 'package:lets_ryde/scrn/memberprofile.dart';
class Booked extends StatelessWidget {
  const Booked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> const Memberprofile())
            );
            
          },
          child: Container(
            margin: const EdgeInsets.all(20),
          
            child: const Center(
              child: Column(
                children: [
                    SizedBox(height: 70),
                  Text('Congratulations!',
                  style:  TextStyle(
                    fontSize: 24,
                    color:Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
          
                    ),
                    ),
                     SizedBox(height: 58),
                    Image(
                      image:AssetImage('assets/images/congratulations.png') ,
                      height: 200,
                  ),
                   SizedBox(height: 60),
                  Text('You have successfully booked your Ryde!',
                  textAlign: TextAlign.center,
                    style:  TextStyle(
                    fontSize: 24,
                    color:Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 73),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                  textAlign: TextAlign.center,
                    style:  TextStyle(
                    fontSize: 14,
                    color:Colors.black,
                    fontFamily: 'Urbanist',
                    
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