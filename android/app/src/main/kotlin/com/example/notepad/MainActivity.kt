package com.example.notepad

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()
@Override
protected void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
  super.configureFlutterEngine(flutterEngine);
  FirebaseAuthPlugin.registerWith(flutterEngine);
  GoogleSignInPlugin.registerWith(flutterEngine);
}

