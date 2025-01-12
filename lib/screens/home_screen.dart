import 'package:flutter/material.dart';
import 'package:vierzieskincare/data/skincare_data.dart';
import 'package:vierzieskincare/models/skincare.dart';
import 'package:vierzieskincare/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFFCAD6F0),
        title: Text(
          'VIERZIE SKINCARE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Text(
            'Nourish, Hydrate, and Shine!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final Skincare skincare = skincareList[index];
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(skincare: skincare),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        skincare.gambar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                            Text(
                            skincare.nama.length > 30 
                              ? skincare.nama.substring(0, 30) + '...' 
                              : skincare.nama,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            skincare.harga,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xff003366),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: skincareList.length,
        ),
      ),
    );
  }
}
