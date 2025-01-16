import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Thank You For Your Order!"),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(25),
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) =>
                  Text(restaurant.displayCartReceipt()),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text("Estimated Delivery Time is: 4:10 PM"),
        ],
      )),
    );
  }
}
