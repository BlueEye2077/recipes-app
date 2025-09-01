import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/providers/favourites_provider.dart';
import 'package:recipe_app/screens/categories_screen.dart';
import 'package:recipe_app/screens/filters_screen.dart';
import 'package:recipe_app/screens/meals_screen.dart';
import 'package:recipe_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeDrawerMealsScreen(i) {
    if (i == 0) {
      Navigator.pop(context);
    } else {
      setState(() {
        Navigator.pop(context);
        _selectedIndex = 0;
      });
    }
  }

  void _changeDrawerFiltersScreen() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> favouritesMealsList = ref.watch(favouritesProvider);

    Widget activeScreen = const CategoriesScreen();
    String activeAppBarTitle = "Select A Category";

    if (_selectedIndex == 0) {
      activeScreen = const CategoriesScreen();
      activeAppBarTitle = "Select A Category";
    } else if (_selectedIndex == 1) {
      activeScreen = MealsScreen(meals: favouritesMealsList);
      activeAppBarTitle = "Favourites Meals";
    }

    return Scaffold(
      drawer: MainDrawer(
        onTapMeals: () {
          _changeDrawerMealsScreen(_selectedIndex);
        },
        onTapFilters: _changeDrawerFiltersScreen,
      ),
      appBar: AppBar(title: Text(activeAppBarTitle,)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTab,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category_sharp),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            activeIcon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
