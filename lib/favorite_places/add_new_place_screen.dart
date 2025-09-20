import 'package:flutter/material.dart';
import 'package:flutter_practice/favorite_places/models/place_item.dart';
import 'package:flutter_practice/favorite_places/providers/places_provider.dart';
import 'package:flutter_practice/favorite_places/widgets/image_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlaceScreen extends ConsumerStatefulWidget {
  const AddNewPlaceScreen({super.key});

  @override
  ConsumerState<AddNewPlaceScreen> createState() {
    return _AddNewPlaceScreenState();
  }
}

class _AddNewPlaceScreenState extends ConsumerState<AddNewPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref
          .read(placesProvider.notifier)
          .addPlace(PlaceItem(title: _enteredTitle));

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new place')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                decoration: const InputDecoration(label: Text('Title')),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              SizedBox(height: 12,),
              ImageInput(),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _saveItem,
                    icon: Icon(Icons.add),
                    label: Text('Add Place'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
