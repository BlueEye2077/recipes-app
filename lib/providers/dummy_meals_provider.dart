import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/dummy_data.dart';


final dummyMealsProvider = Provider((ref)=> dummyMeals);
final availableCategoriesProvider = Provider((ref)=> availableCategories);