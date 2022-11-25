import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/controllerandmodel/model.dart';

class BookController with ChangeNotifier{

bool isLodaing = false;

List<BookModel> lastList =[];

Future<void> getData() async{
isLodaing = true;
  var response = await http.get(Uri.parse("https://mocki.io/v1/0b6f721e-74bd-4084-a821-4c08c2d53455"));
  if(response.statusCode==200){
    isLodaing=false;
    lastList = [];
    lastList.addAll(List<BookModel>.from(jsonDecode(response.body).map((e) => BookModel.fromJson(e))));
    notifyListeners();
  }
  else{
    isLodaing=false;
    print("error");
    notifyListeners();
  }
notifyListeners();
}

}