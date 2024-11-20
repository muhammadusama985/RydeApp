


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_ryde/analytics_service.dart';
import 'package:lets_ryde/scrn/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OfferRideSplash(), // Set your initial screen here
      navigatorObservers: [
        AnalyticsService.observer, // Add analytics observer if needed
      ],
    );
  }
}
