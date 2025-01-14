import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';

import 'food.dart';
import 'package:collection/collection.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Desserts
    Food(
      name: "Chocolate Brownie",
      description: "Rich and fudgy chocolate brownie with chunks of chocolate.",
      imagePath: "lib/images/desserts/chocolate_brownie_dessert.png",
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 0.99),
        Addon(name: "Hot Fudge", price: 1.49),
        Addon(name: "Whipped Cream", price: 1.99),
      ],
    ),
    Food(
      name: "Cheesecake",
      description: "Creamy cheesecake with a graham cracker crust.",
      imagePath: "lib/images/desserts/cheesecake_dessert.png",
      price: 6.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Strawberry Sauce", price: 0.99),
        Addon(name: "Blueberry Topping", price: 1.49),
        Addon(name: "Caramel Sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Apple Pie",
      description: "Classic apple pie with a flaky crust and cinnamon flavor.",
      imagePath: "lib/images/desserts/apple_pie_dessert.png",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 0.99),
        Addon(name: "Caramel Sauce", price: 1.49),
      ],
    ),
    Food(
      name: "Red Velvet Lava Cake",
      description: "Warm red velvet cake with a molten chocolate center.",
      imagePath: "lib/images/desserts/redvelvet_lavacake_dessert.png",
      price: 7.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Lava Sauce", price: 1.99),
        Addon(name: "Whipped Cream", price: 1.49),
      ],
    ),
    Food(
      name: "Tiramisu Cake",
      description: "Classic Italian dessert with layers of coffee-soaked cake.",
      imagePath: "lib/images/desserts/tiramisu_cake_dessert.png",
      price: 6.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Espresso Shot", price: 0.99),
        Addon(name: "Whipped Cream", price: 1.49),
      ],
    ),

    // Drinks
    Food(
      name: "Lemonade",
      description: "Refreshing lemonade made with real lemons.",
      imagePath: "lib/images/drinks/lemonide_drink.png",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 0.49),
        Addon(name: "Lemon Slice", price: 0.99),
      ],
    ),
    Food(
      name: "Iced Tea",
      description: "Cool and sweet iced tea with a hint of lemon.",
      imagePath: "lib/images/drinks/ice_tea.png",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon Slice", price: 0.49),
        Addon(name: "Ice", price: 0.99),
      ],
    ),
    Food(
      name: "Smoothie",
      description: "Healthy and delicious fruit smoothie.",
      imagePath: "lib/images/drinks/smoothie_drink.png",
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein Powder", price: 1.49),
        Addon(name: "Granola", price: 1.99),
      ],
    ),
    Food(
      name: "Mojito",
      description: "Classic mojito with fresh mint and lime.",
      imagePath: "lib/images/drinks/mojito_drink.png",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Mint", price: 0.99),
        Addon(name: "Lime Wedge", price: 1.49),
      ],
    ),
    Food(
      name: "Caramel Macchiato",
      description: "Rich espresso with caramel and steamed milk.",
      imagePath: "lib/images/drinks/caramel_machiato_drink.png",
      price: 5.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Caramel", price: 0.99),
        Addon(name: "Whipped Cream", price: 1.49),
      ],
    ),

    // Burgers
    Food(
      name: "Aloha Burger",
      description: "Sweet and savory burger with grilled pineapple.",
      imagePath: "lib/images/burgers/aloha_burger.png",
      price: 7.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Pineapple", price: 0.99),
        Addon(name: "Teriyaki Sauce", price: 1.49),
      ],
    ),
    Food(
      name: "BBQ Burger",
      description: "Juicy burger topped with BBQ sauce and crispy onions.",
      imagePath: "lib/images/burgers/bbq_burger.png",
      price: 8.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled Onions", price: 0.99),
        Addon(name: "Jalapenos", price: 1.49),
        Addon(name: "Extra BBQ Sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Cheeseburger",
      description: "Classic burger with melted cheese and fresh toppings.",
      imagePath: "lib/images/burgers/cheese_burger.png",
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.49),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      description: "Unique burger with blue cheese and caramelized onions.",
      imagePath: "lib/images/burgers/bluemoon_burger.png",
      price: 9.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Blue Cheese", price: 1.49),
        Addon(name: "Caramelized Onions", price: 1.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description: "Plant-based burger with fresh veggies and sauces.",
      imagePath: "lib/images/burgers/vege_burger.png",
      price: 7.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 1.49),
        Addon(name: "Spicy Sauce", price: 0.99),
      ],
    ),

    // Salads
    Food(
      name: "Asian Sesame Salad",
      description: "Crispy salad with sesame dressing and fresh veggies.",
      imagePath: "lib/images/salads/asiansesame_salad.png",
      price: 5.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Sesame Seeds", price: 0.49),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description: "Classic Caesar salad with croutons and parmesan.",
      imagePath: "lib/images/salads/caesar.png",
      price: 5.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Extra Dressing", price: 0.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description: "Fresh salad with feta cheese, olives, and cucumbers.",
      imagePath: "lib/images/salads/greek_salad.png",
      price: 6.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Feta Cheese", price: 1.49),
        Addon(name: "Olives", price: 0.99),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description: "Healthy salad with quinoa, veggies, and vinaigrette.",
      imagePath: "lib/images/salads/quinoa_salad.png",
      price: 7.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocado", price: 1.49),
        Addon(name: "Extra Vinaigrette", price: 0.99),
      ],
    ),
    Food(
      name: "Southwest Salad",
      description: "Salad with corn, beans, and creamy southwest dressing.",
      imagePath: "lib/images/salads/southwest_salad.png",
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Tortilla Strips", price: 0.99),
      ],
    ),

    // Sides
    Food(
      name: "Garlic Bread",
      description: "Crispy garlic bread with melted butter and herbs.",
      imagePath: "lib/images/sides/garlic_bread_side.png",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Garlic", price: 0.49),
        Addon(name: "Cheese Topping", price: 1.49),
      ],
    ),
    Food(
      name: "Loaded Fries",
      description: "Fries loaded with cheese, bacon, and sour cream.",
      imagePath: "lib/images/sides/loadedfries_side.png",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon Bits", price: 1.49),
      ],
    ),
    Food(
      name: "Mac and Cheese",
      description: "Creamy mac and cheese with a crispy topping.",
      imagePath: "lib/images/sides/mac_side.png",
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Bacon Crumbles", price: 1.49),
        Addon(name: "Extra Cheese", price: 0.99),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Crispy onion rings with dipping sauce.",
      imagePath: "lib/images/sides/onion_rings_side.png",
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Spicy Dip", price: 0.99),
        Addon(name: "BBQ Sauce", price: 0.49),
      ],
    ),
    Food(
      name: "Sweet Potato Fries",
      description: "Sweet potato fries with a hint of cinnamon.",
      imagePath: "lib/images/sides/sweet_potato_side.png",
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cinnamon Sugar", price: 0.49),
        Addon(name: "Marshmallow Dip", price: 1.49),
      ],
    ),
  ];

  final List<CartItem> _cart = [];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = const ListEquality<Addon>()
          .equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(
        food: food,
        selectedAddons: selectedAddons,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
