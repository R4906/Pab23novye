import 'package:flutter/material.dart';
import 'package:flutter_wisata_candi_2627_51/data/candi_data.dart';
import 'package:flutter_wisata_candi_2627_51/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TODO 1 variable
  List<Candi> _filteredcandis = candiList;
  String _searchQuery="";
  final TextEditingController _SearchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title : Text('pencarian Candi')),
       // body
       body: Column(
        children: [
          //TODO4 texfield
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber[50],
              ),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'cari candi',
                  prefixIcon: Icon(Icons.search),
                  border : InputBorder.none,
                  focusedBorder: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  )
                ),
              ),
            ),
          ),

          //TODO5 Listview
          Expanded(
            child: ListView.builder(
              itemCount:_filteredcandis.length,
              itemBuilder:(context, index) {
                final candi = _filteredcandis[index];
                return Card(
                  margin:EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children : [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(candi.imageAsset, fit: BoxFit.cover)
                          ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            candi.name, 
                            style: TextStyle
                            (fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 4,),
                          Text(candi.location),
                        ],
                      )

                    ]
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