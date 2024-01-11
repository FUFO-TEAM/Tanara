class TanamanModel {
  String cahaya;
  String deskripsi;
  String gambar;
  String jenis;
  bool berbahayaUntukHewan;
  List<String> luasRuangan;
  String nama;
  List<String> penyaring;
  String perawatan;

  TanamanModel({
    required this.cahaya,
    required this.deskripsi,
    required this.gambar,
    required this.jenis,
    required this.berbahayaUntukHewan,
    required this.luasRuangan,
    required this.nama,
    required this.penyaring,
    required this.perawatan,
  });

  factory TanamanModel.fromJson(Map<String, dynamic> json) {
    return TanamanModel(
      cahaya: json['cahaya'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      jenis: json['jenis'],
      berbahayaUntukHewan: json['berbahaya_untuk_hewan'],
      luasRuangan: List<String>.from(json['luas_ruangan']),
      nama: json['nama'],
      penyaring: List<String>.from(json['penyaring']),
      perawatan: json['perawatan'],
    );
  }
}
