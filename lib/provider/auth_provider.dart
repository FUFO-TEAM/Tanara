import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> register(
    String email,
    String password,
    String nama,
    String noHp,
  ) async {
    try { 
      setLoading(true);

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
        throw new Exception(e.message);
      } else {
        // Kesalahan umum, tangani sesuai kebutuhan
        print("Registration failed: $e");
        // Tambahkan logika atau pesan ke pengguna di sini
      }
    } finally {
      setLoading(false);
    }

    notifyListeners();
  }
}
