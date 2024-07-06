import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Sign In

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Begin interactive sign in options
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain auth details from request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Finally, let's sign in
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Handle error
      print("Error signing in with Google: $e");
      return null;
    }
  }
}
