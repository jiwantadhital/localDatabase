import 'package:flutter/material.dart';
import 'package:movieapp/allDatas/front_page.dart';
import 'package:movieapp/controllerandmodel/controller.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return BookController();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
       
          primarySwatch: Colors.blue,
        ),
        home: const FrontUi(),
      ),
    );
  }
}

class OurList extends StatelessWidget {
  const OurList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}