// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
// import 'package:lets_ryde/scrn/constants.dart' as global;
// import 'package:lets_ryde/scrn/passengerflow/rydedetails.dart';

// class ResultRyde extends StatelessWidget {
//   final String startLocation;
//   final String destination;
//   final DateTime? traveldate;
//     final int numberOfTravellers;

  
  
//   // Sample data for demonstration
//   final List<Map<String, dynamic>> rides = [
//     {
//       'startTime': '08:30 AM',
//       'endTime': '12:30 PM',
//       'duration': '4 hrs',
//       'startLocation': global.driverstartLocation??'Not Selected',
//       'endLocation': global.driverDestination ?? 'Not Selected',
//       'driverName': 'Michael',
//       'seatsAvailable': '${global.seatsAvailable??1}/4 seats available',
//       'price': '32 GHC',
//       'driverRating': 5,
//       'isVerified': false,
//     },

//   ];
  
//    ResultRyde({super.key, required this.startLocation, required this.destination, required this.traveldate, required this.numberOfTravellers});

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Header Section
//               Stack(
//                 children: <Widget>[
//                   Positioned(
//                     left: 0,
//                     child: Container(
//                       margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
                          
//                         },
//                         child: SvgPicture.asset(
//                           'assets/images/backarrow.svg',
//                           height: 15,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 0,
//                     child: Container(
//                       margin: const EdgeInsets.fromLTRB(5, 15, 0, 30),
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: SvgPicture.asset(
//                           'assets/images/menu.svg',
//                           height: 15,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       margin: const EdgeInsets.fromLTRB(0, 15, 0, 30),
//                       child: const Text(
//                         'Result for Ryde',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                           fontFamily: 'Urbanist',
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // Journey Information Section
//               Container(
//                 padding: const EdgeInsets.fromLTRB(10, 9, 10, 8),
//                 width: screenWidth,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF15B987),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Flexible(
//                             child: Text(
//                               startLocation,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontFamily: 'Urbanist',
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                               softWrap: false,
//                             ),
//                           ),
//                           const Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                           Flexible(
//                             child: Text(
//                               destination,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontFamily: 'Urbanist',
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                               softWrap: false,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Text(
//                       traveldate != null
//                           ? DateFormat('EEEE, MMMM dd, yyyy').format(traveldate!)
//                           : 'Not selected',
//                       style: const TextStyle(
//                         fontSize: 11,
//                         color: Colors.white,
//                         fontFamily: 'Urbanist',
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Icon Buttons Section
//               Container(
//                 margin: const EdgeInsets.fromLTRB(6, 10, 6, 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Transform.translate(
//                       offset: const Offset(15, 0),
//                       child: const IconButton(
//                         icon: Icon(
//                           Iconsax.candle,
//                           color: Colors.black,
//                           size: 18,
//                         ),
//                         onPressed: null,
//                       ),
//                     ),
//                     const IconButton(
//                       icon: Icon(
//                         Iconsax.menu_14,
//                         color: Colors.black,
//                         size: 18,
//                       ),
//                       onPressed: null,
//                     ),
//                   ],
//                 ),
//               ),
//               // Ride List Section
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: rides.length,
//                   itemBuilder: (context, index) {
//                     final ride = rides[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Rydedetails(rides: rides,)),
//                         );
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.fromLTRB(5,0,5,20),
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(7),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 6,
                              
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Column(
                                  
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '${ride['startTime']}',
//                                       style: const TextStyle(
//                                         fontSize: 13,
//                                         color: Colors.black,
//                                         fontFamily: 'Urbanist',
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Text(
//                                   ride['duration'],
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontFamily: 'Urbanist',
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Transform.translate(
//                                   offset: const Offset(5, 0),
//                                   child: const CircleAvatar(
//                                         radius: 12,
//                                         backgroundImage: AssetImage(
//                                             'assets/images/user_placeholder.png'), // Replace with driver's image path
//                                       ),
//                                 ),
//                                      SizedBox(
//                                       width: 50,
//                                        child: Text(
//                                             ride['driverName'],
//                                             style: const TextStyle(
//                                               fontSize: 7.67,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                               fontFamily: 'Urbanist',
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                           softWrap: false,
//                                           ),
//                                      ),
//                                          Row(
                                          
//                                           children: List.generate(ride['driverRating'], 
//                                             (index) => const Icon(
//                                               Iconsax.star1,
//                                               color: Colors.amber,
//                                               size: 7,
//                                             ),
//                                           ),
//                                         ),
                                       
//                                 ]),
//                                 Column(
                                  
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     const SizedBox(height:4),
//                                     Image.asset('assets/images/starttoend.png',
//                                     height: 63, width:40
//                                     ),
//                                     const SizedBox(height: 10),
//                                      Image.asset('assets/images/availableseats.png',
//                                     height: 15, width:10
//                                     ),
//                                     const SizedBox(height: 3),
//                                     const Icon(Iconsax.card_tick,
//                                     size: 12,
//                                     color: Colors.black,
//                                     )
//                                   ]
//                                 ),
//                                 Transform.translate(
//                                   offset: const Offset(-4,0 ),
//                                   child: Column(
                                    
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                   SizedBox(
//                                     width: 90,
//                                     child: Text(
//                                       ride['startLocation'],
//                                       style: const TextStyle(
//                                         fontSize: 13,
//                                         color: Colors.black,
//                                         fontFamily: 'Urbanist',
//                                         fontWeight: FontWeight.bold
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                         softWrap: false,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 33),
//                                   SizedBox(
//                                     width: 90,
//                                     child: Text(
//                                       ride['endLocation'],
//                                       style: const TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                         fontFamily: 'Urbanist',
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                         softWrap: false,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 6),
//                                     Text(
//                                         ride['seatsAvailable'],
//                                         style: const TextStyle(
//                                           fontSize: 9.07,
//                                           color:  Color(0xFF15B987),
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: 'Urbanist',
//                                         ),
//                                       ),
//                                       const SizedBox(height: 3),
//                                       Text(
//                                         ride['price'],
//                                         style: const TextStyle(
//                                           fontSize: 8.37,
//                                           color: Color(0xFF15B987),
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: 'Urbanist',
//                                         ),
//                                       ),
//                                          ride['isVerified']
//                                       ?Transform.translate(
//                                         offset: const Offset(50, -5),
//                                         child: const Column(
//                                           children: [
                                             
//                                             Icon(Icons.verified,
//                                               color: Colors.green,
//                                               size: 18,
//                                             ),
//                                              Text('Verified only',
//                                             style: TextStyle(
//                                               fontSize: 8,
//                                               color: Colors.green,
//                                               fontFamily: 'Urbanist',
//                                             )
//                                             )
//                                           ],
//                                         ),
//                                       )
//                                   : Container(
//                                     height: 0,
//                                   ),
                                    
//                                   ]
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_ryde/scrn/passengerflow/rydedetails.dart';

class Resultryde extends StatefulWidget {
  final String startLocation;
  final String destination;
  final String numberOfTravellers;

  const Resultryde({
    super.key,
    required this.startLocation,
    required this.destination,
    required this.numberOfTravellers
  });

  @override
  _ResultrideState createState() => _ResultrideState();
}

class _ResultrideState extends State<Resultryde> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 219, 236),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Ride Available',
          style: TextStyle(
            fontFamily: "Urbanist-VariableFont_wght.ttf",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('DriverOfferedRydes')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

              final requiredSeats = int.tryParse(widget.numberOfTravellers) ?? 0;


                // Filter documents based on pickup and drop points
             final filteredDocs = snapshot.data!.docs.where((document) {
  final data = document.data() as Map<String, dynamic>;
  final pickupPoint = data['pickupPoint'];
  final dropPoint = data['dropPoint'];
  
  // Convert `numberOfTravellers` and `seatsAvailable` to integers for comparison
  final int enteredSeats = int.tryParse(widget.numberOfTravellers) ?? 0;
  final int availableSeats = int.tryParse(data['seatsAvailable'] ?? '0') ?? 0;

  // Ensure pickup, drop points match, and seats are equal to or greater than entered seats
  return pickupPoint == widget.startLocation &&
      dropPoint == widget.destination &&
      availableSeats >= enteredSeats;
}).toList();

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = filteredDocs[index];
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Rydedetails(
                              rides: document,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: 350,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      width: 320,
                                      height: 110,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Container(
                                              width: 100,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  data['carImageUrl'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            width: 190,
                                            height: 100,
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['carName'],
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '${data['pickupPoint']}, ${data['dropPoint']}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  'Rs ${data['price']}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        'Pick Point:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['pickupPoint'],
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        'Drop Point:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['dropPoint'],
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
