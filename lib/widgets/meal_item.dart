import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onTap});

  final void Function(Meal m) onTap;
  final Meal meal;

  get formattedComlexity =>
      meal.complexity.name.substring(0, 1).toUpperCase() +
      meal.complexity.name.substring(1);
  get formattedAffordability =>
      meal.affordability.name.substring(0, 1).toUpperCase() +
      meal.affordability.name.substring(1);

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    final Color borderColor;

    if (currentBrightness == Brightness.light) {
      borderColor = Colors.white54;
    } else {
      borderColor = Colors.black54;
    }

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onTap(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                decoration: BoxDecoration(color: borderColor),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme
                          .copyWith()
                          .headlineSmall!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: "${meal.duration.toString()} min",
                        ),
                        const SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.work,
                          label: formattedComlexity,
                        ),
                        const SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.attach_money_outlined,
                          label: formattedAffordability,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
