import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Delivery in Progerss ..... "),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          _buildDriverInfo(context),
          Spacer(),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildDriverInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Naufal Arsyaputra Pradana",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        Text(
          "Driver",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        _buildMessageButton(context),
        SizedBox(
          width: 10,
        ),
        _buildCallButton(context),
      ],
    );
  }

  Widget _buildMessageButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.message),
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildCallButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.call),
        color: Colors.green,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        MyReceipt(),
      ],
    );
  }
}
