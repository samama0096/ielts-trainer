import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'frontend/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashView(),
  ));
}
