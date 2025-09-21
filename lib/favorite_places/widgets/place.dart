import 'package:flutter/material.dart';
import 'package:flutter_practice/favorite_places/models/place_item.dart';

class Place extends StatelessWidget {
  const Place({super.key, required this.placeItem, required this.onTap});

  final PlaceItem placeItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: FileImage(placeItem.image),
      ),
      title: Text(
        placeItem.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      onTap: onTap,
    );
  }
}
