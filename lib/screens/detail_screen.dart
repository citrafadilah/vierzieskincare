import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vierzieskincare/data/skincare_data.dart';
import 'package:vierzieskincare/models/skincare.dart';
import 'package:vierzieskincare/screens/favorite_screen.dart';

class DetailScreen extends StatefulWidget {
  final Skincare skincare;

  const DetailScreen({Key? key, required this.skincare}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteSkincares =
        prefs.getStringList('favoriteSkincares') ?? [];
    setState(() {
      _isFavorite = favoriteSkincares.contains(widget.skincare.nama);
    });
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteSkincares =
        prefs.getStringList('favoriteSkincares') ?? [];

    setState(() {
      if (_isFavorite) {
        favoriteSkincares.remove(widget.skincare.nama);
        _isFavorite = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.skincare.nama} removed from favorites'),
          ),
        );
      } else {
        favoriteSkincares.add(widget.skincare.nama);
        _isFavorite = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.skincare.nama} added to favorites'),
          ),
        );
      }
    });

    await prefs.setStringList('favoriteSkincares', favoriteSkincares);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.skincare.gambar,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.skincare.nama.length > 40 
                    ? '${widget.skincare.nama.substring(0, 40)}...' 
                    : widget.skincare.nama,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.red : null,
                    ),
                    onPressed: _toggleFavorite)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Harga: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.skincare.harga,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.skincare.deskripsi,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.skincare.imageurls.length,
                itemBuilder: (context, index) {
                  final url = widget.skincare.imageurls[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        url,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                              child:
                                  Icon(Icons.error)); // Placeholder for error
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}                        