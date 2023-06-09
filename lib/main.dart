import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseexample/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      home: LoginPage(),
    );

  }
}
