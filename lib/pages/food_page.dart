import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  // Menjadikan selectedAddons sebagai final dan immutable
  final Map<Addon, bool> selectedAddons;

  FoodPage({super.key, required this.food})
      : selectedAddons = {
          for (Addon addon in food.availableAddons) addon: false,
        };

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(widget.food.imagePath),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama makanan
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      // Harga makanan
                      Text(
                        '\$${widget.food.price}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Deskripsi makanan
                      Text(widget.food.description),
                      const SizedBox(height: 10),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 10),
                      // Judul add-ons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // List add-ons dengan Checkbox
                      Container(
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
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value ?? false;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Tombol "Add to Cart"
                MyButton(
                  onTap: () {
                    // Tambahkan logika untuk menambahkan ke keranjang
                  },
                  text: "Add to Cart",
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          // Tombol kembali dengan latar belakang lingkaran
          SafeArea(
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
          ),
        ],
      ),
    );
  }
}
