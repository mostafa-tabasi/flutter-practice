import 'package:flutter/material.dart';
import 'package:flutter_practice/meals/data/dummy_data.dart';
import 'package:flutter_practice/meals/meals_screen.dart';
import 'package:flutter_practice/meals/models/category.dart';
import 'package:flutter_practice/meals/models/meal.dart';
import 'package:flutter_practice/meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onFavoriteToggle});

  final void Function(Meal meal) onFavoriteToggle;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onFavoriteToggle: onFavoriteToggle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onCategorySelect: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
