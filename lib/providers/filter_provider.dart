import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/providers/dummy_meals_provider.dart';

enum FilterOptions { isGluteenFree, isLactoseFree, isVegetarian, isVegan }

class FilterNotifier extends StateNotifier<Map<FilterOptions, bool>> {
  FilterNotifier()
    : super({
        FilterOptions.isGluteenFree: false,
        FilterOptions.isLactoseFree: false,
        FilterOptions.isVegetarian: false,
        FilterOptions.isVegan: false,
      });

  void setFilter({required FilterOptions option, required bool value}) {
    state = {...state, option: value};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<FilterOptions, bool>>(
      (ref) => FilterNotifier(),
    );

final filteredMealsListProvider = Provider((ref) {
  final List<Meal> currentMeals = ref.watch(dummyMealsProvider);
  final Map<FilterOptions, bool> currentFilters = ref.watch(filterProvider);
  return currentMeals.where((meal) {
    if (currentFilters[FilterOptions.isGluteenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (currentFilters[FilterOptions.isLactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (currentFilters[FilterOptions.isVegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (currentFilters[FilterOptions.isVegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
