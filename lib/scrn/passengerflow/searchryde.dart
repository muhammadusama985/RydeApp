import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Make sure to import Fluttertoast
import 'package:lets_ryde/scrn/passengerflow/resultryde.dart';

class SearchRyde extends StatefulWidget {
  const SearchRyde({super.key});

  @override
  State<SearchRyde> createState() => _SearchRydeState();
}

class _SearchRydeState extends State<SearchRyde> {
  late TextEditingController startLocationController;
  late TextEditingController destinationController;
  late TextEditingController dateController;
  DateTime? travelDate;
  int _selectedTravelers = 1; // State variable for the number of travelers

  @override
  void initState() {
    super.initState();
    startLocationController = TextEditingController();
    destinationController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    startLocationController.dispose();
    destinationController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _validateAndNavigate() {
    final String startLocation = startLocationController.text.trim();
    final String destination = destinationController.text.trim();
    final DateTime? travelDate = this.travelDate;
  final String numberOfTravellers = _selectedTravelers.toString(); // Convert to String

    if (startLocation.isEmpty || destination.isEmpty || travelDate == null) {
      // Show error message using Fluttertoast or any other method
      Fluttertoast.showToast(
        msg: "Please fill all the fields",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    // Navigate to ResultRyde with all required data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Resultryde(
          startLocation: startLocation,
          destination: destination,
          // traveldate: travelDate,
          numberOfTravellers: numberOfTravellers,
        ),
      ),
    );
  }

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
            child: SingleChildScrollView( // Added to prevent overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: const Text(
                            'Search a Ryde',
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
                  const SizedBox(height: 5),
                  const SizedBox(height: 20), // Replaced Spacer with SizedBox for better control
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '  Where are you starting from?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(21, 185, 135, 1),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 52,
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 5),
                          child: TextFormField(
                            controller: startLocationController,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              fillColor: Color(0xFFF6F6F8),
                              filled: true,
                              hintText: ' Start location',
                              hintStyle: TextStyle(
                                color: Color(0xFFCDCDCD),
                                fontSize: 14,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          '  Where are you travelling to',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(21, 185, 135, 1),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 52,
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 5),
                          child: TextFormField(
                            controller: destinationController,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              fillColor: Color(0xFFF6F6F8),
                              filled: true,
                              hintText: ' Destination',
                              hintStyle: TextStyle(
                                color: Color(0xFFCDCDCD),
                                fontSize: 14,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          '  When are you travelling?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(21, 185, 135, 1),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 52,
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 5),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                            controller: dateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              fillColor: const Color(0xFFF6F6F8),
                              filled: true,
                              hintText: travelDate == null
                                  ? ' Select a date'
                                  : DateFormat('EEEE, MMMM dd, yyyy').format(travelDate!),
                              hintStyle: const TextStyle(
                                color: Color(0xFFCDCDCD),
                                fontSize: 14,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFF6F6F8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              suffixIcon: IconButton(
                                iconSize: 20, // Increased icon size for better visibility
                                icon: const Icon(Icons.calendar_month),
                                color: const Color.fromRGBO(21, 185, 135, 1),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(), // Changed to allow future dates
                                    lastDate: DateTime(2100), // Extended to future dates
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: Color.fromRGBO(21, 185, 135, 1), // header background color
                                            onPrimary: Colors.white, // header text color
                                            onSurface: Color.fromRGBO(21, 185, 135, 1), // body text color
                                          ),
                                          dialogBackgroundColor: Colors.white,
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (pickedDate != null) {
                                    setState(() {
                                      travelDate = pickedDate;
                                      dateController.text =
                                          DateFormat('EEEE, MMMM dd, yyyy')
                                              .format(pickedDate);
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 41),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '  No. of Travellers',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(21, 185, 135, 1),
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            
                            Container(
                              height: 33,
                              width: 68,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: const Color(0xFFCDCDCD),
                                  )),
                              child: DropdownButton<int>(
                                value: _selectedTravelers, // Updated to use state variable
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 19,
                                elevation: 16,
                                style: const TextStyle(
                                  color: Color.fromRGBO(21, 185, 135, 1),
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                ),
                                underline: Container(
                                  height: 0,
                                ),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    _selectedTravelers = newValue!;
                                  });
                                },
                                items: <int>[1, 2, 3, 4, 5]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Center(child: Text(value.toString())),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Replaced Spacer with SizedBox for better control
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 56,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: _validateAndNavigate, // Updated to call the new method
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(21, 185, 135, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Replaced Spacer with SizedBox for better control
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromRGBO(27, 94, 32, 1),
                        ),
                      ),
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
