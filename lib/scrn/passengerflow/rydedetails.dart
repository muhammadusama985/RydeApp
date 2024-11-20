import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Rydedetails extends StatefulWidget {
  final DocumentSnapshot rides;

  const Rydedetails({
    super.key,
    required this.rides,
  });

  @override
  State<Rydedetails> createState() => _RydedetailsState();
}

class _RydedetailsState extends State<Rydedetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  void launchPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      throw 'Could not launch $phoneLaunchUri';
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FadeTransition(
              opacity: _animation,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.rides['carImageUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      widget.rides['carName'],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      "Verified Driver By Pakistan",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      'Rs ${widget.rides['price']}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      "Description:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: Container(
                      color: Colors.white,
                      height: 200,
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildDetailItem('Car Name', widget.rides['carName'],
                              Icons.directions_car),
                          _buildDetailItem(
                              'Car Number',
                              widget.rides['carNumber'],
                              Icons.confirmation_number),
                          _buildDetailItem('Drop Point',
                              widget.rides['dropPoint'], Icons.pin_drop),
                          _buildDetailItem('Pickup Point',
                              widget.rides['pickupPoint'], Icons.location_on),
                          _buildDetailItem('Price Rs', widget.rides['price'],
                              Icons.attach_money),
                          _buildDetailItem('Seats Available',
                              widget.rides['seatsAvailable'], Icons.event_seat),
                          _buildDetailItem('Phone Number',
                              widget.rides['phoneNumber'], Icons.phone),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.rides[
                                    'userImageUrl'], // Assuming 'userImageUrl' is the key for user's profile image URL
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Owner',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontFamily:
                                        "Urbanist-VariableFont_wght.ttf",
                                  ),
                                ),
                                Text(
                                  widget.rides['firstName'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        "Urbanist-VariableFont_wght.ttf",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 120),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blue,
                            child: IconButton(
                              icon: const Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: SizedBox(
                      height: 50,
                      width: 320,
                      child: ElevatedButton(
                        onPressed: () {
                          launchPhone(widget.rides['phoneNumber']);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                          shadowColor: Colors.black,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Call The Owner',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String heading, String data, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          heading,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Urbanist-VariableFont_wght.ttf',
          ),
        ),
        const SizedBox(width: 20),
        Text(
          data,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.blue,
            fontFamily: 'Urbanist-VariableFont_wght.ttf',
          ),
        ),
      ],
    );
  }
}
