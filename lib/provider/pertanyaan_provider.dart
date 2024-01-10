import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanara/models/pertanyaan_model.dart';

class PertanyaanProvider {
  String baseURL = "https://tanara-25a3c-default-rtdb.firebaseio.com";
  List<PertanyaanModel> _pertanyaanList = [];

  List<PertanyaanModel> get pertanyaanList => _pertanyaanList;

  Future<void> fetchPertanyaan() async {
  var url = Uri.parse('$baseURL/pertanyaan.json');

  var headers = {
    'content-type': 'application/json',
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);

    // Clear the existing list before populating it
    _pertanyaanList.clear();

    for (var item in data) {
      _pertanyaanList.add(PertanyaanModel.fromJson(item));
    }
  } else {
    throw Exception("Gagal Get Pertanyaan: ${response.statusCode}");
  }
}
}
