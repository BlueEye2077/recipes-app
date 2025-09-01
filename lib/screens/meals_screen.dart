import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/screens/meal_details_screen.dart';
import 'package:recipe_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.barLabel});
  final String? barLabel;
  final List<Meal> meals;

  _onToggleDetailsScreen(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget avtiveScreen;

    if (meals.isNotEmpty) {
      avtiveScreen = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => meals
            .map(
              (meal) => MealItem(
                meal: meal,
                onTap: (m) {
                  _onToggleDetailsScreen(context, m);
                },
              ),
            )
            .toList()[index],
      );
    } else {
      avtiveScreen = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh ... nothing here!",
              softWrap: true,
              style: Theme.of(context).textTheme
                  .copyWith()
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 5),
            Text(
              "Try Adding Some...",
              softWrap: true,
              style: Theme.of(
                context,
              ).textTheme.copyWith().bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      );
    }

    if (barLabel == null) {
      return avtiveScreen;
    }

    return Scaffold(
      appBar: AppBar(title: Text(barLabel!)),
      body: avtiveScreen,
    );
  }
}
