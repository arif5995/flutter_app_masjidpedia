import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {

    try {
      var akun = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await akun!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
      );

      // User user = await _auth.signInWithG

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      print("akun $akun");
      return userCredential.user;

    } catch (error) {
      print(error);
    }
  }

  Future<String> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    return 'sukses';
  }

  Future<User?>authenticate() async {
    var user = await FirebaseAuth.instance.currentUser;
    print("uid $user");
    return user;
  }

  Future<bool>hasUid() async {
    final uid = await FirebaseAuth.instance.currentUser?.uid;
    print("uid $uid");
    if (uid != null ) {
      return true;
    }
    return false;
  }
}