class Tanaman {
  String cahaya;
  String deskripsi;
  String gambar;
  String jenis;
  List<String> luasRuangan;
  String nama;
  List<String> penyaring;
  String perawatan;

  Tanaman({
    required this.cahaya,
    required this.deskripsi,
    required this.gambar,
    required this.jenis,
    required this.luasRuangan,
    required this.nama,
    required this.penyaring,
    required this.perawatan,
  });

  factory Tanaman.fromJson(Map<String, dynamic> json) {
    return Tanaman(
      cahaya: json['cahaya'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      jenis: json['jenis'],
      luasRuangan: List<String>.from(json['luas_ruangan']),
      nama: json['nama'],
      penyaring: List<String>.from(json['penyaring']),
      perawatan: json['perawatan'],
    );
  }
}
