import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_ryde/scrn/passengerflow/booked.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? _selectedPaymentMethod ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
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
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const Text(
                          'Payment Method',
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
                const SizedBox(height: 30),
                const Text(
                  'Select Payment Method',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose your desired and best suitable payment method',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Urbanist',
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                RadioListTile<String>(
                  activeColor:  const Color.fromRGBO(21, 185, 135, 1),
                  value: 'Bank Transfer',
                  groupValue: _selectedPaymentMethod,
                  title: const Text('Bank Transfer',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),),
                  subtitle: const Text('Make transaction through bank account',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  )),
                  secondary: const Image( image: AssetImage('assets/images/bank.png'),height: 28,
                   ),
                   controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor:  const Color.fromRGBO(21, 185, 135, 1),
                  value: 'Credit Card',
                  groupValue: _selectedPaymentMethod,
                  title: const Text('Credit Card',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),),
                  subtitle: const Text('Make transaction through credit card',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  )),
                  secondary:const Image( image: AssetImage('assets/images/card.png'),height: 24,
                   ),
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor:  const Color.fromRGBO(21, 185, 135, 1),
                  value: 'Mobile Money',
                  groupValue: _selectedPaymentMethod,
                  title: const Text('Mobile Money',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  subtitle: const Text('Make transaction through mobile',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  ),),
                  secondary:const Image(image:  AssetImage('assets/images/mobilecard.png')),
                   
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value!;
                    });
                  },
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Cost',
                      style: TextStyle(
                      fontSize: 16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600, ),
                    ),
                    Text(
                      '32 GHC',
                      style: TextStyle(
                      fontSize: 16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,),
                    ),
                  ],
                ),
                const SizedBox(height:12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate dapibus aliquet. Donec dignissim nunc eu purus.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payable Cost',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '32 GHC',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _selectedPaymentMethod == null
                ? null // Disable button if no payment method is selected
                : () {
                    // Perform the booking functionality
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const Booked())
                      );
                    print('Booking with $_selectedPaymentMethod');
                  },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor:  _selectedPaymentMethod == null
                      ? Colors.grey
                      :const Color.fromRGBO(21, 185, 135, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Book now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
