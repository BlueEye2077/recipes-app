import 'package:flutter/material.dart';
import 'package:recipe_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.cat, required this.onTap});

  final Category cat;
  final void Function(Category cat) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(cat);
      },

      splashColor: cat.color,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [cat.color, cat.color.withValues(alpha: 0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          cat.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
