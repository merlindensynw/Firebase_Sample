import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseexample/screens/home_page.dart';
import 'package:firebaseexample/screens/welcome page.dart';
import 'package:firebaseexample/screens/register_page.dart';
import 'package:firebaseexample/screens/welcome%20page.dart';
import 'package:firebaseexample/utils/users.dart';
import 'package:flutter/material.dart';

import '../utils/fire_auth.dart';
import '../utils/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Authentication'),
        ),
        body:  Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailTextController,
                  focusNode: _focusEmail,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _passwordTextController,
                  focusNode: _focusPassword,
                  obscureText: true,
                  validator: (value) => Validator.validatePassword(
                    password: value,
                  ),
                  decoration: InputDecoration(
                    hintText: "Password",
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                _isProcessing
                    ? CircularProgressIndicator()
                    : Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        _focusEmail.unfocus();
                        _focusPassword.unfocus();

                        if (_formKey.currentState!
                            .validate()) {
                          setState(() {
                            _isProcessing = true;
                          });

                          Users? user = await FireAuth
                              .signInUsingEmailPassword(
                            email: _emailTextController.text,
                            password:
                            _passwordTextController.text,
                          );

                          setState(() {
                            _isProcessing = false;
                          });

                          if (user != null) {
                            Navigator.of(context)
                                .pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
      ),
    );
  }
}
