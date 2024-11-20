import 'package:flutter/material.dart';
import 'package:lets_ryde/scrn/driver_flow/driverSelection.dart';


class DriverWelcome extends StatefulWidget {
   const DriverWelcome({super.key});

  @override
  State<DriverWelcome> createState() => _DriverWelcomeState();
}

class _DriverWelcomeState extends State<DriverWelcome> {
 

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: const Text(
                          "LET'S RYDE (DRIVER)",
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
                const Spacer(),
                const Text.rich(
                  
                  TextSpan(
                    children: [
                      TextSpan(
                    text: "Welcome to ",
                style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(21, 185, 135, 1),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,

                 )
                  ),
                  TextSpan(
                    text: "Let's Ryde!",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(21, 185, 135, 1),
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic
                      ),
                  )
                  ],
                  ),
                        ),
                const Spacer(flex: 1),
               const Image(image: 
               AssetImage('assets/images/welcome.png'),
                height: 250,
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Driverselection()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(21, 185, 135, 1)),
                          
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                const Text(
                  'Terms and Conditions',
                  style:  TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold
                  ),
                ),
                const TextButton(
                  onPressed: null,
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Color.fromRGBO(27, 94, 32, 1),
                    ),
                  ),
                ),

              ]
              ),
              
          )
        )
      )
      
    );
  }
}
//