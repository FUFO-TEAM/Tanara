import 'dart:convert';

import 'package:tanara/models/pertanyaan_model.dart';

import 'package:http/http.dart' as http;

class PertanyaanService {
  String baseURL = "https://tanara-25a3c-default-rtdb.firebaseio.com";

  Future<List<PertanyaanModel>> getPertanyaan() async {
    var url = Uri.parse('$baseURL/pertanyaan.json');

    var headers = {
      'content-type': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<PertanyaanModel> pertanyaan = data.map((item) {
        return PertanyaanModel.fromJson(item);
      }).toList();

      return pertanyaan;
    } else {
      throw Exception("Gagal Get Pertanyaan: ${response.statusCode}");
    }
  }
}
