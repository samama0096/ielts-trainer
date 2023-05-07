import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class UserFirebaseServices {
//instance for collection of authenticated users
  final _authusersDoc = FirebaseFirestore.instance.collection('auth_usersdata');
  //instance for collection of active users
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  get user => _firebaseauth.currentUser;
//save login status of user to active users collection!

  Future<int> checkIfUsernamePresent(String username) async {
    DocumentSnapshot docSnap = await _authusersDoc.doc(username).get();
    if (!docSnap.exists) {
      return 200;
    } else {
      return 300;
    }
  }

  Future createNewUserInDataBase(Usermodel user) async {
    Map<String, dynamic> data = <String, dynamic>{
      "fname": user.fname,
      "lname": user.lname,
      "username": user.username,
      "email": user.email,
    };

    await _authusersDoc
        .doc(user.username)
        .set(data)
        .whenComplete(() => print(" added to the database"))
        .catchError((e) => print(e));
  }

  Future<int> signUp(Usermodel user, String password) async {
    int res = await checkIfUsernamePresent(user.username!);
    if (res == 200) {
      try {
        await _firebaseauth.createUserWithEmailAndPassword(
          email: user.email!,
          password: password,
        );
        await _firebaseauth.currentUser!.updateDisplayName(user.username);
        await createNewUserInDataBase(user);
        return 200;
      } on FirebaseAuthException catch (e) {
        print(e.message);
        return 400;
      }
    } else if (res == 300) {
      return 300;
    }
    return 400;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseauth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<int> sendResetPassEmail(String email) async {
    try {
      await _firebaseauth.sendPasswordResetEmail(
        email: email,
      );
      return 200;
    } catch (e) {
      print(e);
      return 300;
    }
  }
}
