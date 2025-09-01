import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/providers/favourites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Meal> favouritesMeals = ref.watch(favouritesProvider);
    final bool isExsiting = favouritesMeals.contains(widget.meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.meal.title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {
              final bool isAdded = ref
                  .read(favouritesProvider.notifier)
                  .toggleFav(widget.meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {
                      ref
                          .read(favouritesProvider.notifier)
                          .toggleFav(widget.meal);
                    },
                  ),
                  content: Text(
                    isAdded
                        ? "Meal is added to favourites"
                        : "Meal is removed from favourites",
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(seconds: 1 ),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: child,
              ),
              child: Icon(
                isExsiting ? Icons.star : Icons.star_border_outlined,
                key: ValueKey(isExsiting),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: widget.meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(widget.meal.imageUrl),
                  height: 250,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ...widget.meal.ingredients.map(
                (i) => Text(
                  i,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),
              ...widget.meal.steps.map(
                (s) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    s,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
