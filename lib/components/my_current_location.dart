import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final TextEditingController _textController = TextEditingController();

  void _openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _buildLocationSearchDialog(context),
    );
  }

  Widget _buildLocationSearchDialog(BuildContext context) {
    return AlertDialog(
      title: Text("Your Location"),
      content: _buildSearchField(),
      actions: _buildDialogActions(context),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        hintText: "Input Address...",
      ),
    );
  }

  List<Widget> _buildDialogActions(BuildContext context) {
    return [
      MaterialButton(
        onPressed: () {
          _textController.clear();
          Navigator.pop(context);
        },
        child: Text("Cancel"),
      ),
      MaterialButton(
        onPressed: () {
          String newAddress = _textController.text;
          context.read<Restaurant>().UpdateDeliveryAddress(newAddress);
          _textController.clear();
          Navigator.pop(context);
        },
        child: Text('Save'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDeliveryNowText(context),
          _buildLocationRow(context),
        ],
      ),
    );
  }

  Widget _buildDeliveryNowText(BuildContext context) {
    return Text(
      "Delivery Now",
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
    );
  }

  Widget _buildLocationRow(BuildContext context) {
    return GestureDetector(
      onTap: () => _openLocationSearchBox(context),
      child: Row(
        children: [
          Consumer<Restaurant>(
            builder: (context, restaurant, child) => Text(
              restaurant.deliveryAddress,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.inversePrimary),
        ],
      ),
    );
  }
}
