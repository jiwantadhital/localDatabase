import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movieapp/controllerandmodel/model.dart';

class SavedDetails extends StatelessWidget {
var datas;
SavedDetails({required this.datas});
  @override
  Widget build(BuildContext context) {
        BookModel childrenClass = BookModel.fromJson(datas);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context,index){
        return Container(
          child: Column(
            children: [
              Text(childrenClass.chapters![index].number.toString())
            ],
          ),
        );
      }),
    );
  }
}