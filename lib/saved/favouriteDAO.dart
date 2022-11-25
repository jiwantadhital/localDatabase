import 'package:floor/floor.dart';
import 'package:movieapp/saved/favourite_model.dart';

@dao
abstract class FavouriteDAO{

@Query('SELECT * FROM Favourite')
Future<List<Favourite>> getAll();

@insert
Future<void> insertFav(Favourite fav);

@delete
Future<int> deleteFav(Favourite fav);

}