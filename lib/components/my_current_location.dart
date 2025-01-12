import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Your Location"),
          content: TextField(
            decoration: InputDecoration(
              hintText: "Search Address...",
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            MaterialButton(
                onPressed: () => Navigator.pop(context), child: Text('Save'))
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery Now",
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            GestureDetector(
                onTap: () => openLocationSearchBox(context),
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
                ))
          ],
        ));
  }
}
