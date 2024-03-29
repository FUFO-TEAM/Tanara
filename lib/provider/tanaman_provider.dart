import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tanara/models/tanaman_model.dart';

class TanamanProvider with ChangeNotifier{
  String baseURL = "https://tanara-25a3c-default-rtdb.firebaseio.com"; // Replace with your actual API URL
  List<TanamanModel> _tanamanList = [];

  List<TanamanModel> get tanamanList => _tanamanList;

  Future<void> fetchTanaman() async {
    var url = Uri.parse('$baseURL/tanaman.json');

    var headers = {
      'content-type': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      // Clear the existing list before populating it
      _tanamanList.clear();

      for (var item in data) {
        _tanamanList.add(TanamanModel.fromJson(item));
      }
    } else {
      throw Exception("Failed to get Tanaman: ${response.statusCode}");
    }

    notifyListeners();
  }

  Future<void> fetchRekomendasi(List<String> jawaban) async {
    var url = Uri.parse('https://magnificent-fawn-getup.cyclic.app/rekomendasiTanaman/${jawaban[0]}/${jawaban[1]}/${jawaban[2]}/${jawaban[3]}');

    var headers = {
      'content-type': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      // Clear the existing list before populating it
      _tanamanList.clear();

      for (var item in data) {
        _tanamanList.add(TanamanModel.fromJson(item));
      }
    } else {
      throw Exception("Failed to get Tanaman: ${response.statusCode}");
    }

    notifyListeners();
  }
}
