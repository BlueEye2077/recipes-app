import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/providers/dummy_meals_provider.dart';
import 'package:recipe_app/providers/filter_provider.dart';
import 'package:recipe_app/screens/meals_screen.dart';
import 'package:recipe_app/widgets/category_item.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  void _onToggleMealScreen({
    required List<Meal> mealsList,
    required BuildContext context,
    required Category category,
  }) {
    final List<Meal> availableMeals = mealsList
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(meals: availableMeals, barLabel: "Select A Meal"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Category> categoriesList = ref.watch(
      availableCategoriesProvider,
    );

    final List<Meal> filteredMealsList = ref.watch(filteredMealsListProvider);

    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
        padding: const EdgeInsets.all(25),
        children: categoriesList
            .map(
              (category) => CategoryItem(
                cat: category,
                onTap: (cat) {
                  _onToggleMealScreen(
                    mealsList: filteredMealsList,
                    context: context,
                    category: cat,
                  );
                },
              ),
            )
            .toList(),
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
            .animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
        child: child,
      ),
    );
  }
}
