import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi{
  static final _googleSignIn= GoogleSignIn();
  static Future login()=>_googleSignIn.signIn();
}