import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/meal.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super([]);

  bool toggleFav(Meal item) {
    if (state.contains(item)) {
      state = [...state.where((element) => element != item)];
      return false;
    } else {
      state = [...state, item];
      return true;
    }
  }

  bool isExsiting(item) {
    if (state.contains(item)) {
      return true;
    }
    return false;
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>(
      (ref) => FavouritesNotifier(),
    );
