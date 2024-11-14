// ignore_for_file: unused_local_variable, unused_field, empty_catches
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wetalk/utils/utils.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?>get authChanges => _auth.authStateChanges();


Future<bool>signInWithGoogle(BuildContext context) async{
  bool res = false;
  try{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
    await _auth.signInWithCredential(credential);

  User? user = userCredential.user;

  if(user!=null){
    if(userCredential.additionalUserInfo!.isNewUser) {
      await _firestore.collection('users').doc(user.uid).set({
        'username': user.displayName,
        'uid': user.uid,
        'profilePhoto': user.photoURL,
      });
    }
    res = true;
  }
  }on FirebaseAuthException catch(e){
    // ignore: use_build_context_synchronously
    ShowSnackBar(context, e.message!);
    res = false;
  }
  return res;
 }
}