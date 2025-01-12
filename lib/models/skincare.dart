class Skincare {
  final String nama;
  final String kategori;
  final String deskripsi;
  final String harga;
  final String gambar;
  bool isFavorite = false;
  final List<String> imageurls;

  Skincare({
    required this.nama,
    required this.kategori,
    required this.deskripsi,
    required this.harga,
    required this.gambar,
    this.isFavorite = false,
    required this.imageurls,
  });
}