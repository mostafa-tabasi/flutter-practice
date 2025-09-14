import 'package:flutter/material.dart';
import 'package:flutter_practice/meals/widgets/filter_item.dart';

enum Filter { glutenFree, lactoseFree, vegetarianFree, veganFree }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFreeFilter = false;
  var _veganFreeFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilter = widget.currentFilters[Filter.vegetarianFree]!;
    _veganFreeFilter = widget.currentFilters[Filter.veganFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      /*
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (ctx) => Tabs()));
          }
        },
      ),
      */
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarianFree: _vegetarianFreeFilter,
            Filter.veganFree: _veganFreeFilter,
          });
          return false;
        },
        child: Column(
          children: [
            FilterItem(
              label: 'Gluten-free',
              description: 'Only include gluten-free meals',
              value: _glutenFreeFilter,
              onToggle: (isChecked) {
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
              },
            ),
            FilterItem(
              label: 'Lactose-free',
              description: 'Only include lactose-free meals',
              value: _lactoseFreeFilter,
              onToggle: (isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
            ),
            FilterItem(
              label: 'Vegetarian-free',
              description: 'Only include vegetarian-free meals',
              value: _vegetarianFreeFilter,
              onToggle: (isChecked) {
                setState(() {
                  _vegetarianFreeFilter = isChecked;
                });
              },
            ),
            FilterItem(
              label: 'Vegan-free',
              description: 'Only include vegan-free meals',
              value: _veganFreeFilter,
              onToggle: (isChecked) {
                setState(() {
                  _veganFreeFilter = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
