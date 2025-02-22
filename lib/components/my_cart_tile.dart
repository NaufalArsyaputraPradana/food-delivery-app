import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              _buildCartItemInfo(context, restaurant),
              _buildAddonsList(context, cartItem),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartItemInfo(BuildContext context, Restaurant restaurant) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              cartItem.food.imagePath,
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.food.name),
              Text(
                '\$${cartItem.food.price.toString()}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              QuantitySelector(
                quantity: cartItem.quantity,
                food: cartItem.food,
                onDecrement: () {
                  restaurant.removeFromCart(cartItem);
                },
                onIncrement: () {
                  restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                },
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildAddonsList(BuildContext context, CartItem cartItem) {
    if (cartItem.selectedAddons.isEmpty) {
      return SizedBox();
    }

    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
        children: cartItem.selectedAddons
            .map(
              (addon) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Row(
                    children: [
                      Text(addon.name),
                      Text('(\$${addon.price})'),
                    ],
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onSelected: (value) {},
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
