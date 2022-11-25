import 'dart:async';

import 'package:floor/floor.dart';
import 'package:movieapp/saved/favouriteDAO.dart';
import 'package:movieapp/saved/favourite_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version:1, entities:[Favourite])
abstract class AppDatabase extends FloorDatabase{
FavouriteDAO get favouriteDAO;
}