import 'package:flutter_practice/favorite_places/models/place_item.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:sqflite/sqflite.dart' as sql;

class PlacesNotifier extends StateNotifier<List<PlaceItem>> {
  PlacesNotifier() : super([]);

  void addPlace(PlaceItem place) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(place.image.path);
    final copiedImage = await place.image.copy('${appDir.path}/$filename');

    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)',
        );
      },
      version: 1,
    );

    db.insert('user_places', {
      'id': place.id,
      'title': place.title,
      'image': copiedImage,
      'lat': place.location.latitude,
      'lng': place.location.longitude,
      'address': place.location.address,
    });

    state = [...state, place];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<PlaceItem>>(
  (ref) => PlacesNotifier(),
);
