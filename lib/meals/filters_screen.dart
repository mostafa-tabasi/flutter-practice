import 'package:flutter/material.dart';
import 'package:flutter_practice/meals/providers/filters_provider.dart';
import 'package:flutter_practice/meals/widgets/filter_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFreeFilter = false;
  var _veganFreeFilter = false;

  @override
  void initState() {
    super.initState();
    // Use read instead of watch because "initState" only calls once
    final activeFilters = ref.read(filtersProvider);

    _glutenFreeFilter = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = activeFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilter = activeFilters[Filter.vegetarian]!;
    _veganFreeFilter = activeFilters[Filter.vegan]!;
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
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegetarianFreeFilter,
            Filter.vegan: _veganFreeFilter,
          });

          return true;
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
