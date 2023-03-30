import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseexample/utils/fire_auth.dart';
import 'package:flutter/material.dart';

import '../utils/users.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeFormKey = GlobalKey<FormState>();

  final _messageTextController = TextEditingController();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey.shade200,
          child: Form(
            key: _homeFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FireAuth.getStream(),
                  builder: (BuildContext c,
                      AsyncSnapshot<List<Map<String, dynamic>>?> s) {
                    var chat = s.data;
                    if (chat == null || chat.isEmpty) {
                      return Text('NO Chat');
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final Map<String, dynamic> i in chat)
                          Container(
                            alignment:i['userId']==FirebaseAuth.instance.currentUser?.uid? Alignment.centerRight:null,
                            child:Text(i['message'],
                          ),
                          ),
                      ],
                    );
                  },
                ),
                TextFormField(
                  controller: _messageTextController,
                  validator: (String? s) {
                    if (s == null) {
                      return null;
                    }
                    if (s.isEmpty) {
                      return 'Can\'t be empty';
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () async {
                          if (_homeFormKey.currentState!.validate()) {
                            setState(() {
                              _isProcessing = true;
                            });
                            await FireAuth.addMessage(
                                message: _messageTextController.text,
                                uid: FirebaseAuth.instance.currentUser?.uid ??
                                    '');
                            setState(() {
                              _isProcessing = false;
                            });
                            _messageTextController.clear();
                          }
                        }),
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Type your Message Here',
                  ),
                ),
              ],
            ),
          ),
        ),
    );

  }
}
