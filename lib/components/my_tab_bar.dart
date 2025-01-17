import 'package:flutter/material.dart';
import '../models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return _buildTabBar(context);
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      labelColor: Theme.of(context).colorScheme.primary,
      unselectedLabelColor: Colors.grey,
      tabs: _buildCategoryTabs(),
    );
  }

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }
}
