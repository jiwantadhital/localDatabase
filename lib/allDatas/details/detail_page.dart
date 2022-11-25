import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/controllerandmodel/controller.dart';
import 'package:movieapp/saved/favouriteDAO.dart';
import 'package:movieapp/saved/favourite_model.dart';
import 'package:provider/provider.dart';

import '../../saved/database/database.dart';

class DetailsPage extends StatefulWidget {
  int count;
  FavouriteDAO dao;
DetailsPage({required this.count, required this.dao});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    var details = context.read<BookController>().lastList[widget.count];
    print(details.toString());
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            
            onTap: ()async{
              Favourite fav = new Favourite(
                id: details.id??1,
                 call: jsonEncode(details.toJson()));

                 widget.dao.insertFav(fav);
            },

            child: Icon(Icons.save)),
        ],
        title: Text("Details"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Chapter Title:- ${details.title}"),
            Text("Chapter Desc:- ${details.description}")
          ],
        ),
      ),
    );
  }
}