import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/widgets/custom_page_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class IndexScreen extends StatefulWidget {
  final bool logged;

  IndexScreen({
    Key? key,
    required this.logged,
  }) : super(key: key);

  @override
  createState() => IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  IndexScreenState();

  @override
  Widget build(BuildContext context) {
    if (this.widget.logged == true) {
      Future.delayed(Duration(seconds: 2), () {
        router.navigateTo(
          context,
          "/files",
          transition: TransitionType.inFromRight,
          clearStack: true,
        );
      });

      return CustomPageLoader();
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: _signInButton(),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      // splashColor: Colors.grey,
      onPressed: () async {
        final result = await signInWithGoogle();
        if (result != null) {
          router.navigateTo(
            context,
            "/files",
            transition: TransitionType.inFromRight,
            clearStack: true,
          );
        }
      },
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      // highlightElevation: 0,
      // borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/icons/google_logo.png"),
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Login com Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<User?> signInWithGoogle() async {
    final googleSignInAccount = await GoogleSignIn().signIn();

    if (googleSignInAccount == null) {
      return null;
    }

    final googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    if (userCredential.user == null) {
      return null;
    }

    return userCredential.user!;
  }

  Future<void> signOutGoogle() async {
    await GoogleSignIn().signOut();
  }
}
