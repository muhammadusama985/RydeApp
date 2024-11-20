import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lets_ryde/scrn/chat.dart';
class Memberprofile extends StatefulWidget {
  const Memberprofile({super.key});

  @override
  State<Memberprofile> createState() => _MemberprofileState();
}

class _MemberprofileState extends State<Memberprofile> {
  
  @override
  Widget build(BuildContext context) {
    int driverRating=5;
    String membername= 'Micheal';
    String carmdoel= 'Notspecified';
    int rydesOffered= 2;
    int rydesTaken=3;
    int memberAge=32;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(25,10,25,10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                  Positioned(
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 15, 0, 30),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/menu.svg',
                          height: 15,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                      child: const Text(
                        'Member Profile',
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
              const SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text( membername,
                       style: const TextStyle(
                        fontSize: 23,
                        color:  Color.fromRGBO(21, 185, 135, 1),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                       ),
                       ),
                        Text('Age $memberAge',
                       style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                       ),),
                       const SizedBox(height: 4),
                       const Text('Member Since April 2022',
                       style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                       ),),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Rydes Taken',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                  const SizedBox(width: 40),
                  Text('$rydesTaken',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    color: Color.fromRGBO(21, 185, 135, 1),
                    fontWeight: FontWeight.bold
                  ),)
                ]
              ),
              const SizedBox(height: 12),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Rydes Offered',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                  const SizedBox(width: 40),
                  Text('$rydesOffered',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    color: Color.fromRGBO(21, 185, 135, 1),
                    fontWeight: FontWeight.bold
                  ),),
                  
                                     
                ]
              ),
              const Divider(),
                 Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0),
                  Text('Driving skills  ', style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                  SizedBox(height: 5),
                    Text('Punctuality ', style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  SizedBox(height: 8),
                  Text('Communication  ', style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  SizedBox(height:5),
                    Text('Reliability       ', style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                  ),
        
                ],
              ),
              const SizedBox(width: 40),
            Column(
                children: [
                   Row(
            children: [
               const SizedBox(
                height: 25,
                width: 15, // Adjust this value to reduce or increase spacing
                child: 
                  Icon(
                     Iconsax.star1, 
                    color: Colors.amber,
                    size: 14,
                ),
                
            ),
            Text(' $driverRating',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
            ),
            )
                ]
          ),
            Row(
            children: [
               const SizedBox(
                height: 25,
                width: 15, // Adjust this value to reduce or increase spacing
                child: 
                  Icon(
                     Iconsax.star1, 
                    color: Colors.amber,
                    size: 14,
                ),
                
            ),
            Text(' $driverRating',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
            ),
            )
                ]
          ),
          Row(
            children: [
               const SizedBox(
                height: 25,
                width: 15, // Adjust this value to reduce or increase spacing
                child: 
                  Icon(
                     Iconsax.star1, 
                    color: Colors.amber,
                    size: 14,
                ),
                
            ),
            Text(' $driverRating',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
            ),
            )
                ]
          ),
          Row(
            children: [
               const SizedBox(
                height: 25,
                width: 15, // Adjust this value to reduce or increase spacing
                child: 
                  Icon(
                     Iconsax.star1, 
                    color: Colors.amber,
                    size: 14,
                ),
                
            ),
            Text(' $driverRating',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
            ),
            )
                ]
          ),
          ],
              ),
            ],
          ),
          const Divider(),
           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ryde',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600
                    )
                    ),
                    const SizedBox(width: 7),
                    const Image(image: AssetImage('assets/images/availableseats.png'),
                    height: 12,
                    color: Color(0xFF15B987),
                    ),
                      const Spacer(),
                     Text(
                        carmdoel,//Add actual car model from drivers account 
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                      ]
                      ),
                      const Spacer(),
                       OutlinedButton(
                        style: ButtonStyle(
                          side: WidgetStateProperty.all(const BorderSide(color: Color(0xFF15B987))),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                           MaterialPageRoute(builder: (context)=> const Chats()));
                        },
                      child: const Text('Chat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color:  Color(0xFF15B987),
                        fontFamily: 'Urabnist',
                        
                      ),
                      ))

        
            ],
          ),
        ),
      ),
    );
  }
}

