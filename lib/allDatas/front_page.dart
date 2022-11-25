import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movieapp/allDatas/details/detail_page.dart';
import 'package:movieapp/controllerandmodel/controller.dart';
import 'package:movieapp/saved/database/database.dart';
import 'package:movieapp/saved/favouriteDAO.dart';
import 'package:movieapp/saved/saved_page.dart';
import 'package:provider/provider.dart';

class FrontUi extends StatefulWidget {
  const FrontUi({super.key});

  @override
  State<FrontUi> createState() => _FrontUiState();
}

class _FrontUiState extends State<FrontUi> {
  late FavouriteDAO dao;

void _getData()async{
final database = await $FloorAppDatabase.databaseBuilder("edmt fav1.db").build();
dao= database.favouriteDAO;
}

@override
  void initState() {
    _getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    context.read<BookController>().getData();
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return SavedData(dao: dao,);
              }));
            },
            child: Icon(Icons.favorite)),
        ],
        title: Text("MainPage"),
      ),
      body: Consumer<BookController>(
        builder: (context,value,child){
          return value.isLodaing?CircularProgressIndicator(): Container(
                child: ListView.builder(
          itemCount: value.lastList.length,
          itemBuilder: (context,index){
          return GestureDetector(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailsPage(count: index,dao: dao,);
              }));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.green,
              height: 120,
              child: Column(
                children: [
                  Text(value.lastList[index].title??"No Data"),
                  Text(value.lastList[index].description??"No Data",maxLines: 2,)
                ],
              ),
            ),
          );
                }),
              );
        },
      )
    );
  }
}