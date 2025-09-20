import 'package:flutter/material.dart';
import 'package:flutter_practice/favorite_places/add_new_place_screen.dart';
import 'package:flutter_practice/favorite_places/providers/places_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesScreen extends ConsumerWidget {
  const FavoritePlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          return ListTile(title: Text(item.title), onTap: () {});
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AddNewPlaceScreen()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
