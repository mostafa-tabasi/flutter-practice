import 'package:flutter/material.dart';
import 'package:flutter_practice/meals/providers/filters_provider.dart';
import 'package:flutter_practice/meals/widgets/filter_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: Column(
        children: [
          FilterItem(
            label: 'Gluten-free',
            description: 'Only include gluten-free meals',
            value: activeFilters[Filter.glutenFree]!,
            onToggle: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
          ),
          FilterItem(
            label: 'Lactose-free',
            description: 'Only include lactose-free meals',
            value: activeFilters[Filter.lactoseFree]!,
            onToggle: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),
          FilterItem(
            label: 'Vegetarian-free',
            description: 'Only include vegetarian-free meals',
            value: activeFilters[Filter.vegetarian]!,
            onToggle: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FilterItem(
            label: 'Vegan-free',
            description: 'Only include vegan-free meals',
            value: activeFilters[Filter.vegan]!,
            onToggle: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
