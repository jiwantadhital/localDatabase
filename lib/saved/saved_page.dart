import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movieapp/allSavedDetails.dart';
import 'package:movieapp/controllerandmodel/model.dart';
import 'package:movieapp/saved/favouriteDAO.dart';
import 'package:movieapp/saved/favourite_model.dart';

class SavedData extends StatefulWidget {
  FavouriteDAO dao;
  SavedData({required this.dao});

  @override
  State<SavedData> createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {

  var allData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
      ),
      body: FutureBuilder<List<Favourite?>>(
        initialData: [],
        future: widget.dao.getAll(),
        builder: (context,AsyncSnapshot<List<Favourite?>> snapshot){
          var favList = snapshot.data;
        return snapshot.hasData? ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context,index){
          allData = jsonDecode(favList![index]!.call);
          var childrenCl = BookModel.fromJson(allData);
          return GestureDetector(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context){
              //   return SavedDetails(
              //     datas: jsonDecode(favList[index]!.call),
              //   );
              // }));
            },
            child: Container(
              color: Colors.amber,
              margin: EdgeInsets.all(5),
              height: 100,
              child: Column(
                children: [
                  Text(childrenCl.title.toString()),
                  Text("desc"),
                ],
              ),
            ),
          );
      }):CircularProgressIndicator();
      })
    );
  }
}