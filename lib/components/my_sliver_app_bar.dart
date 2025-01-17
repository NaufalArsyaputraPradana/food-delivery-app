import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return _buildSliverAppBar(context);
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: _buildActions(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      title: _buildTitle(),
      flexibleSpace: _buildFlexibleSpace(context, child, title),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        },
        icon: const Icon(Icons.shopping_cart),
      ),
    ];
  }

  Widget _buildTitle() {
    return const Text("Sunset Dinner");
  }

  Widget _buildFlexibleSpace(
    BuildContext context,
    Widget child,
    Widget title,
  ) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: child,
      ),
      centerTitle: true,
      title: title,
      titlePadding: const EdgeInsets.symmetric(horizontal: 16.0),
      expandedTitleScale: 1,
    );
  }
}
