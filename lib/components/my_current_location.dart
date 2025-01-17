import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

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
      decoration: InputDecoration(
        hintText: "Search Address...",
      ),
    );
  }

  List<Widget> _buildDialogActions(BuildContext context) {
    return [
      MaterialButton(
        onPressed: () => Navigator.pop(context),
        child: Text("Cancel"),
      ),
      MaterialButton(
        onPressed: () => Navigator.pop(context),
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
          Text(
            "6901 Hollywood Blv",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.keyboard_arrow_down_rounded)
        ],
      ),
    );
  }
}
