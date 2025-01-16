import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:awesome_icons/awesome_icons.dart";
import 'package:notepad/signin/google_signin.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: SizedBox(
                width: double.infinity,
                child: FittedBox(
                  child: Column(
                    children: [
                      Icon(
                        size: 50,
                        FontAwesomeIcons.solidStickyNote,
                        color: const Color.fromARGB(255, 226, 181, 16),
                      ),
                      Text(
                        "Notepad",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 25,
              children: [
                ActioButton(
                  icon: FontAwesomeIcons.google,
                  callback: signInWithGoogle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActioButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback callback;

  const ActioButton({super.key, required this.icon, required this.callback});

  @override
  Widget build(BuildContext context) {
    ValueNotifier userCredential = ValueNotifier('');

    return GestureDetector(
      onTap: () async {
        userCredential.value = await signInWithGoogle();
        if (userCredential.value != null)
          print(userCredential.value.user!.email);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
