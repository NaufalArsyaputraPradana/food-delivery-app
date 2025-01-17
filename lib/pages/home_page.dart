import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_food_tile.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import '../models/food.dart';
import '../components/my_current_location.dart';
import '../components/my_description_box.dart';
import '../components/my_drawer.dart';
import '../components/my_sliver_app_bar.dart';
import '../components/my_tab_bar.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: _buildNestedScrollView(context),
    );
  }

  Widget _buildNestedScrollView(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        _buildSliverAppBar(context),
      ],
      body: _buildTabBarView(context),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return MySliverAppBar(
      title: MyTabBar(tabController: _tabController),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildDivider(context),
          const MyCurrentLocation(),
          const MyDescriptionBox(),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      indent: 25,
      endIndent: 25,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restaurant.menu),
        );
      },
    );
  }
}
