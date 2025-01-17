import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  Map<Addon, bool> selectedAddons = {};

  @override
  void initState() {
    super.initState();
    for (Addon addon in widget.food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        _buildContent(context),
        _buildBackButton(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(context),
          _buildFoodInfo(context),
          _buildAddons(context),
          _buildAddToCartButton(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Image.asset(widget.food.imagePath);
  }

  Widget _buildFoodInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFoodName(context),
          _buildFoodPrice(context),
          _buildFoodDescription(context),
        ],
      ),
    );
  }

  Widget _buildFoodName(BuildContext context) {
    return Text(
      widget.food.name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _buildFoodPrice(BuildContext context) {
    return Text(
      '\$${widget.food.price}',
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildFoodDescription(BuildContext context) {
    return Text(widget.food.description);
  }

  Widget _buildAddons(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.food.availableAddons.length,
        itemBuilder: (context, index) {
          Addon addon = widget.food.availableAddons[index];
          return CheckboxListTile(
            title: Text(addon.name),
            subtitle: Text('\$${addon.price}'),
            value: selectedAddons[addon],
            onChanged: (bool? value) {
              setState(() {
                selectedAddons[addon] = value ?? false;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return MyButton(
      onTap: () => addToCart(widget.food, selectedAddons),
      text: "Add to Cart",
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
    );
  }
}
