import 'package:flutter_practice/favorite_places/models/place_item.dart';
import 'package:flutter_riverpod/legacy.dart';

class PlacesNotifier extends StateNotifier<List<PlaceItem>> {
  PlacesNotifier() : super([]);

  void addPlace(PlaceItem place) {
    state = [...state, place];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<PlaceItem>>(
  (ref) => PlacesNotifier(),
);
