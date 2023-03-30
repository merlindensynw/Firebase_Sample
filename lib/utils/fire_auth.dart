import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseexample/utils/users.dart';

class FireAuth {
  // For registering a new user
  static Future<Users?> registerUsingEmailPassword({
    required Users users,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: users.email,
        password: password,
      );

      final user =
          users.rebuild((p0) => p0.id = userCredential.user?.uid ?? '');
      var ref = FirebaseFirestore.instance.collection('users').doc(user.id);
      await ref.set(user.toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(Users data) async {
    final User? user = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(user?.uid ?? '')
        .update(data.toJson());
  }

  Future<void> delete(Users data) async {
    final User? user = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid ?? '')
        .delete();
  }

  static Stream<List<Map<String, dynamic>>> getStream() {
    Stream<QuerySnapshot<Map<String, dynamic>>> ref =
        FirebaseFirestore.instance.collection('chat').snapshots();
    Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> docs =
        ref.map((event) => event.docs);
    return docs.map((event) => event.map((e) => (e.data())).toList());
  }

  // For signing in an user (have already registered)
  static Future<Users?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      DocumentSnapshot<Map<String, dynamic>> ref = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();
      Users user = Users.fromJson(ref.data() ?? {});
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> addMessage(
      {required String message, required String uid}) async {
    var ref = FirebaseFirestore.instance.collection('chat').doc();
    await ref.set({'message': message, 'userId': uid});
  }

  Stream<List<Map<String, dynamic>>> getMessages() {
    Stream<QuerySnapshot<Map<String, dynamic>>> ref =
        FirebaseFirestore.instance.collection('chat').snapshots();
    return ref.map((QuerySnapshot<Map<String, dynamic>> event) =>
        event.docs.map((e) => e.data()).toList());
  }
}
