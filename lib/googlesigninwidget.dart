import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

var name;

var uemail;

var imageurl;

var getname;
Future signinwithgoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken);

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  assert(user!.email != null);
  assert(user!.displayName != null);
  assert(user!.photoURL != null);

  name = user!.displayName;
  uemail = user!.email;
  imageurl = user!.photoURL;

  final User? currentuser = await authResult.user;
  assert(user!.uid == currentuser!.uid);
  getname = name;
  return 'signInWithGoogle suceeded:$user ';
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
}
