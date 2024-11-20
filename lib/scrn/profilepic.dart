import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:lets_ryde/scrn/signupscreens/welcome.dart';

class Profilepic extends StatefulWidget {
  const Profilepic({super.key});

  @override
  State<Profilepic> createState() => _ProfilepicState();
}

class _ProfilepicState extends State<Profilepic> {
  XFile? _profileImage;
  bool _isLoading = false; // Loading state

  // Method to upload image to Firebase Storage with user ID as filename
  Future<String?> _uploadImage(File image) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser; // Get the current user
      if (user != null) {
        String userId = user.uid; // Get the user ID
        // Use the user ID as the file name
        String fileName = 'PassengersProfile_pics/$userId.png';
        // Upload the file to Firebase Storage
        UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(image);
        // Wait until the upload is complete
        TaskSnapshot snapshot = await uploadTask;
        // Get the download URL of the uploaded image
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        print('User is not logged in.');
        return null;
      }
    } catch (e) {
      print('Failed to upload image: $e');
      return null;
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profileImage = pickedImage;
      });

      // Image upload is moved to the Submit button
    }
  }

  Future<void> _submit() async {
    if (_profileImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a profile picture.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    String? downloadUrl = await _uploadImage(File(_profileImage!.path));

    setState(() {
      _isLoading = false;
    });

    if (downloadUrl != null) {
      print('Image uploaded successfully: $downloadUrl');
      // You can save the download URL to Firestore or use it as needed

      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    } else {
      print('Image upload failed.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image upload failed. Please try again.')),
      );
    }
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 15, 0, 10),
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
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: const Text(
                          'Profile',
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
                const Text(
                  'Add Profile Picture',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(21, 185, 135, 1),
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  width: screenWidth,
                  child: const Text(
                    'To proceed further. Please upload a profile picture which identifies you clearly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      color: Color(0xFF808D9E),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                IconButton(
                  onPressed: _pickImage,
                  icon: _profileImage == null
                      ? Image.asset('assets/images/profilepic.png', height: 260)
                      : Image.file(File(_profileImage!.path), height: 260),
                ),
                const Spacer(flex: 2),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  height: 56,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submit, // Disable button when loading
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(21, 185, 135, 1),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 2.0,
                            ),
                          )
                        : const Text(
                            "Submit",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                  ),
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
