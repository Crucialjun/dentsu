import 'package:dentsu/core/locator.dart';
import 'package:dentsu/firebase_options.dart';
import 'package:dentsu/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setUpLocator();
  runApp(const MyApp());
}
