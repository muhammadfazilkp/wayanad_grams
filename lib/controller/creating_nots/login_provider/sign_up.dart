import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zudocoz/view/bottom_nav/bottom_navigation.dart';

class SignUpMeathods extends ChangeNotifier {
  final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisiblity = false;

  void register(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful.'),
          ),
        );
      }

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const BottomNavigationPage()),
        (Route<dynamic> route) => false,
      );
      // You can navigate to another page or perform other actions here upon successful registration
    } catch (signUpError) {
      if (signUpError is FirebaseAuthException) {
        if (signUpError.code == 'email-already-in-use') {
          debugPrint("--- Already Existed!");
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'The email address is already in use by another account.',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            );
          }

          return;
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('An error occurred: ${signUpError.message}'),
              ),
            );
          }
        }
      }
    }
  }

  bool? succes;
  String? userEmail;
  Future<void> signIn(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      (Error);
    }
  }
}
