import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  Future<void> register(
    String email,
    String password,
    String nama,
    String noHp,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Setelah pendaftaran berhasil, Anda mungkin ingin melakukan sesuatu seperti menyimpan data pengguna ke database atau melakukan tindakan lain.

      // Registrasi berhasil
      print("Registration successful: $email");

      // Anda dapat menambahkan logika atau pesan ke pengguna di sini
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          // Email sudah terdaftar, Anda dapat memberikan pesan kepada pengguna atau mengambil tindakan lain sesuai kebutuhan
          print("Registration failed: Email already in use");
          // Tambahkan logika atau pesan ke pengguna di sini
        } else {
          // Kesalahan registrasi lainnya, tangani sesuai kebutuhan
          print("Registration failed: $e");
          // Tambahkan logika atau pesan ke pengguna di sini
        }
      } else {
        // Kesalahan umum, tangani sesuai kebutuhan
        print("Registration failed: $e");
        // Tambahkan logika atau pesan ke pengguna di sini
      }
    }

    notifyListeners();
  }
}
