import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebaseexample/screens/login_page.dart';

import '../utils/fire_auth.dart';

class WelcomePage extends StatefulWidget {
  final User user;

  const WelcomePage({required this.user});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final bool _isSendingVerification = false;
  final bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome To My Page",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            ElevatedButton(onPressed: () async {
              await FireAuth.signout();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) =>
                  LoginPage()
              ),
              );
            }, child: Text('sign out'))

          ],
        ),
      );
  }
}