import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/infrastructure/navigation/routes.dart';
import 'package:dating_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(
      clientId:
          "73539699405-248ke328fe9p6aqspv84r0rl375u7l1d.apps.googleusercontent.com");

  var isGoogleAuthenticating = false.obs;

  void continueWithGoogle(BuildContext context) async {
    isGoogleAuthenticating.value = true;
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process.
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var userCredential = await _auth.signInWithCredential(credential);

      // Successfully signed in, navigate to the next screen.
      // Navigator.push(...);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          addUser(userCredential.user?.uid);
        }
        Get.offAndToNamed(Routes.HOME);
      }
    } catch (error) {
      print(error);
      // Handle errors with SnackBar notifications.
      var errorMessage = 'Error occurred, please try again.';
      if (error is FirebaseAuthException) {
        errorMessage = error.message ?? errorMessage;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(16),
          content: Text(
            errorMessage,
            style: GoogleFonts.acme(
              fontSize: 16,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    isGoogleAuthenticating.value = false;
  }

  addUser(String? userId) {
    if (userId == null) {
      return;
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(UserModel(id: userId).toJson());
  }
}
