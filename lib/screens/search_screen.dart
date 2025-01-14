import 'package:flutter/material.dart';
import 'package:vierzieskincare/models/skincare.dart';
import 'package:vierzieskincare/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<Skincare> allSkincare;

  const SearchScreen({Key? key, required this.allSkincare}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Skincare> _searchResult = [];
  late TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _searchResult = widget.allSkincare;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchSkincare(String query) {
    List<Skincare> searchResult = widget.allSkincare.where((skincare) {
      return skincare.nama.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _searchResult = searchResult;
    });
  }

  void _sortSkincare(String category) {
    List<Skincare> sortedResult;
    if (category == 'All') {
      sortedResult = widget.allSkincare;
    } else {
      sortedResult = widget.allSkincare.where((skincare) {
        return skincare.kategori == category;
      }).toList();
    }

    setState(() {
      _selectedCategory = category;
      _searchResult = sortedResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFFCAD6F0),
        title: Text(
          'Search',
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
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Skincare',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _searchSkincare,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _sortSkincare(newValue);
                }
              },
              items: <String>['All', 'Pembersih Wajah', 'Toner', 'Serum']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: _searchResult.length,
              itemBuilder: (context, index) {
                Skincare skincare = _searchResult[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(skincare: skincare),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                skincare.nama,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(skincare.harga),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
