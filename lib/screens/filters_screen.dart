import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<FilterOptions, bool> currentFilterOptions = ref.watch(
      filterProvider,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              "Gluten-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Only include gluten-free meals",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            value: currentFilterOptions[FilterOptions.isGluteenFree]!,
            onChanged: (value) => {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(option: FilterOptions.isGluteenFree, value: value),
            },
          ),
          SwitchListTile(
            title: Text(
              "Lactose-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Only include lactose-free meals",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            value: currentFilterOptions[FilterOptions.isLactoseFree]!,
            onChanged: (value) => {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(option: FilterOptions.isLactoseFree, value: value),
            },
          ),
          SwitchListTile(
            title: Text(
              "Vegetarian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Only include vegetarian meals",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            value: currentFilterOptions[FilterOptions.isVegetarian]!,
            onChanged: (value) => {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(option: FilterOptions.isVegetarian, value: value),
            },
          ),
          SwitchListTile(
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Only include vegan meals",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            value: currentFilterOptions[FilterOptions.isVegan]!,
            onChanged: (value) => {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(option: FilterOptions.isVegan, value: value),
            },
          ),
        ],
      ),
    );
  }
}
