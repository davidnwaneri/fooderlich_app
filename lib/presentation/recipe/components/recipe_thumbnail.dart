import 'package:flutter/material.dart';
import 'package:fooderlich_app/api/models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({Key? key, required this.recipe,}) : super(key: key);

  final SimpleRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              recipe.dishImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            recipe.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            recipe.duration,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}