import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/firebase_options.dart';
import 'package:jobspot/jobspot_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const JobspotApp());
}
