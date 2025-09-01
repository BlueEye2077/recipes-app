import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onTapMeals,
    required this.onTapFilters,
  });
  final void Function() onTapMeals;
  final void Function() onTapFilters;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsetsGeometry.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(
                    context,
                  ).colorScheme.onPrimary.withValues(alpha: 0.8),
                  Theme.of(
                    context,
                  ).colorScheme.onPrimary.withValues(alpha: 0.5),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_sharp,
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                ),
                const SizedBox(width: 17),
                Text(
                  // textAlign: TextAlign.center,
                  "Meals App",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            leading: Icon(
              Icons.restaurant,
              size: 25,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            onTap: onTapMeals,
          ),
          ListTile(
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            leading: Icon(
              Icons.settings,
              size: 25,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            onTap: onTapFilters,
          ),
        ],
      ),
    );
  }
}
