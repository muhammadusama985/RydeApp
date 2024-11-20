import 'package:flutter/material.dart';
class Feedthanks extends StatelessWidget {
  const Feedthanks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  "Thank you for your rating!",
                   style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,)
                ),
                const Spacer(flex: 1),
                Image.asset('assets/images/feedthanks.png'),
                const Spacer(),
                const Text("With your rating you help us make Let's Ryde better for everyone!",
                textAlign: TextAlign.center,
                 style: TextStyle(
                  
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,)
                      ),
                      const Spacer(),
                      const Spacer(),
                      

              ],
            )
          )
        )),
    );
  }
}