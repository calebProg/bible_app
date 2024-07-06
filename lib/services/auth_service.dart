import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Sign In

  signInWithGoogle() async {
    // Begin interactive sign in options
    final GoogleSignInAccount? googleUser =
        await GoogleSignInAccount().signIn();
    // Obtain auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // finally let's sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
