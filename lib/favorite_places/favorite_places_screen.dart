import 'package:flutter/material.dart';
import 'package:flutter_practice/favorite_places/add_new_place_screen.dart';
import 'package:flutter_practice/favorite_places/models/place_item.dart';
import 'package:flutter_practice/favorite_places/place_details.dart';
import 'package:flutter_practice/favorite_places/providers/places_provider.dart';
import 'package:flutter_practice/favorite_places/widgets/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<FavoritePlacesScreen> createState() {
    return _FavoritePlacesState();
  }
}

class _FavoritePlacesState extends ConsumerState<FavoritePlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(placesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final myPlaces = ref.watch(placesProvider);

    Widget content;

    if (myPlaces.isEmpty) {
      content = Center(
        child: Text(
          'No places added yet',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: myPlaces.length,
        itemBuilder: (ctx, index) {
          final item = myPlaces[index];
          return Place(
            placeItem: item,
            onTap: () {
              _openPlaceDetails(ctx, item);
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddNewPlace(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : content,
        ),
      ),
    );
  }

  void _openPlaceDetails(BuildContext context, PlaceItem item) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => PlaceDetailsScreen(place: item)),
    );
  }

  void _openAddNewPlace(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const AddNewPlaceScreen()));
  }
}
