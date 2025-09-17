import 'package:flutter/material.dart';
import 'package:flutter_practice/shopping_list/models/category.dart';

const categories = {
  Categories.vegetables: ShoppingCategory(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: ShoppingCategory('Fruit', Color.fromARGB(255, 145, 255, 0)),
  Categories.meat: ShoppingCategory('Meat', Color.fromARGB(255, 255, 102, 0)),
  Categories.dairy: ShoppingCategory('Dairy', Color.fromARGB(255, 0, 208, 255)),
  Categories.carbs: ShoppingCategory('Carbs', Color.fromARGB(255, 0, 60, 255)),
  Categories.sweets: ShoppingCategory(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: ShoppingCategory(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: ShoppingCategory(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: ShoppingCategory(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: ShoppingCategory('Other', Color.fromARGB(255, 0, 225, 255)),
};
