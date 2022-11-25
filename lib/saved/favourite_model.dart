import 'package:floor/floor.dart';

@entity
class Favourite {
  @primaryKey
  final int id;
  final String call;
  Favourite({
    required this.id,
    required this.call,
  });
}
