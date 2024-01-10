class PertanyaanModel {
  int? id;
  List<OpsiModel>? opsi;
  String? pertanyaan;

  PertanyaanModel({
    required this.id,
    required this.opsi,
    required this.pertanyaan,
  });

  PertanyaanModel.fromJson(Map<String, dynamic> json) {
  id = json["id"] is int ? json["id"] : int.tryParse(json["id"].toString());
  pertanyaan = json["pertanyaan"] as String;

  // Parse the list of options
  opsi = (json['opsi'] as List<dynamic>).map((opsiItem) {
    return OpsiModel.fromJson(opsiItem);
  }).toList();
}


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'opsi': opsi!.map((opsiModel) => opsiModel.toJson()).toList(),
      'pertanyaan': pertanyaan,
    };
  }
}


class OpsiModel {
  int? id;
  String? jawaban;

  OpsiModel({
    required this.id,
    required this.jawaban,
  });

  OpsiModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    jawaban = json["jawaban"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jawaban': jawaban,
    };
  }
}
