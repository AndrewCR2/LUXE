import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator{
  static Future<User?> InitSign({required BuildContext context})async{
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;

    GoogleSignIn objGoogleSignIn = GoogleSignIn();
    GoogleSignInAccount? objGoogleSignInAccount = await objGoogleSignIn.signIn();

    if (GoogleSignInAccount != null) {
      GoogleSignInAuthentication objGoogleSignInAuthentication = await objGoogleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: objGoogleSignInAuthentication.accessToken,
        idToken: objGoogleSignInAuthentication.idToken
      );

      try {
        UserCredential userCredential = await authenticator.signInWithCredential(credential);
        // print(userCredential);
        user = userCredential.user;
        return user;
      }on FirebaseAuthException catch (e) {
        print('ERROR EN LA AUTENTICACION');
      }
    }
  }
}