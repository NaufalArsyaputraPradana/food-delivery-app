import 'package:flutter/material.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFoodItem(context, food, onTap),
        _buildDivider(context),
      ],
    );
  }

  Widget _buildFoodItem(
      BuildContext context, Food food, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            _buildFoodInfo(context, food),
            SizedBox(
              width: 15,
            ),
            _buildFoodImage(context, food),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodInfo(BuildContext context, Food food) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(food.name),
          Text(
            '\$' + food.price.toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            food.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodImage(BuildContext context, Food food) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        food.imagePath,
        height: 120,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.tertiary,
      endIndent: 25,
      indent: 25,
    );
  }
}
