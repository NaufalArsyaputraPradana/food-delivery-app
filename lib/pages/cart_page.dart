import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return _buildCartPage(context, userCart, restaurant);
      },
    );
  }

  Widget _buildCartPage(
    BuildContext context,
    List<CartItem> userCart,
    Restaurant restaurant,
  ) {
    return Scaffold(
      appBar: _buildAppBar(context, restaurant),
      body: _buildBody(context, userCart),
    );
  }

  AppBar _buildAppBar(BuildContext context, Restaurant restaurant) {
    return AppBar(
      title: const Text("Cart"),
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        _buildClearCartButton(context, restaurant),
      ],
    );
  }

  IconButton _buildClearCartButton(
    BuildContext context,
    Restaurant restaurant,
  ) {
    return IconButton(
      onPressed: () {
        _showClearCartDialog(context, restaurant);
      },
      icon: Icon(Icons.delete),
    );
  }

  void _showClearCartDialog(
    BuildContext context,
    Restaurant restaurant,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are You Sure You Want to CLear the Cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              restaurant.clearCart();
            },
            child: Text("Yes"),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<CartItem> userCart) {
    return Column(
      children: [
        _buildCartList(context, userCart),
        _buildCheckoutButton(context),
        SizedBox(
          height: 25,
        )
      ],
    );
  }

  Widget _buildCartList(BuildContext context, List<CartItem> userCart) {
    return Expanded(
      child: Column(
        children: [
          userCart.isEmpty
              ? Expanded(child: Center(child: Text("Cart is Empty...")))
              : Expanded(
                  child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      final cartItem = userCart[index];

                      return MyCartTile(cartItem: cartItem);
                    },
                  ),
                ),
        ],
      ),
    );
  }

  MyButton _buildCheckoutButton(BuildContext context) {
    return MyButton(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(),
        ),
      ),
      text: "Go to checkout",
    );
  }
}
