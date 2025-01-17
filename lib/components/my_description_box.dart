import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    final mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: _buildDescriptionBox(
          context, myPrimaryTextStyle, mySecondaryTextStyle),
    );
  }

  Widget _buildDescriptionBox(
    BuildContext context,
    TextStyle myPrimaryTextStyle,
    TextStyle mySecondaryTextStyle,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDeliveryFeeColumn(myPrimaryTextStyle, mySecondaryTextStyle),
          _buildDeliveryTimeColumn(myPrimaryTextStyle, mySecondaryTextStyle),
        ],
      ),
    );
  }

  Widget _buildDeliveryFeeColumn(
    TextStyle myPrimaryTextStyle,
    TextStyle mySecondaryTextStyle,
  ) {
    return Column(
      children: [
        Text(
          '\$0.99',
          style: myPrimaryTextStyle,
        ),
        Text(
          'Delivery Fee',
          style: mySecondaryTextStyle,
        ),
      ],
    );
  }

  Widget _buildDeliveryTimeColumn(
    TextStyle myPrimaryTextStyle,
    TextStyle mySecondaryTextStyle,
  ) {
    return Column(
      children: [
        Text(
          '15-30 min',
          style: myPrimaryTextStyle,
        ),
        Text(
          'Delivery Time',
          style: mySecondaryTextStyle,
        ),
      ],
    );
  }
}
