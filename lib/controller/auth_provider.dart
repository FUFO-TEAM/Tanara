import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  var isLogin = true;
  var enteredEmail = '';
  var enteredPassword = '';

 void submit() async {
    final _isValid = form.currentState?.validate();

    if (_isValid == null || !_isValid) {
      return;
    }

    form.currentState?.save();

    try {
      UserCredential userCredential;

      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      }

      // Registrasi atau masuk berhasil
      print("Authentication successful: ${userCredential.user?.email}");

      // Tambahkan logika navigasi atau pesan ke pengguna di sini
    } catch (e) {
      if (e is FirebaseAuthException) {
        // Kesalahan autentikasi Firebase
        if (e.code == 'email-already-in-use') {
          print("Email already in use");
          // Tambahkan logika atau pesan ke pengguna di sini
        } else if (e.code == 'wrong-password') {
          print("Wrong password");
          // Tambahkan logika atau pesan ke pengguna di sini
        } else {
          print("Authentication failed: $e");
          // Tambahkan logika atau pesan ke pengguna di sini
        }
      } else {
        print("Error: $e");
        // Tambahkan logika atau pesan ke pengguna di sini
      }
    }

    notifyListeners();
  }
}