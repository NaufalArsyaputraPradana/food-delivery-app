import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_drawer_tile.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: _buildDrawerContent(context),
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        _buildDivider(context),
        _buildDrawerTiles(context),
        const Spacer(),
        _buildLogoutTile(context),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Icon(
        Icons.lock_open_rounded,
        size: 80,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Divider(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Widget _buildDrawerTiles(BuildContext context) {
    return Column(
      children: [
        MyDrawerTile(
          text: "H O M E",
          icon: Icons.home,
          onTap: () => Navigator.pop(context),
        ),
        MyDrawerTile(
          text: "S E T T I N G",
          icon: Icons.settings,
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return MyDrawerTile(
      text: "L O G O U T",
      icon: Icons.logout,
      onTap: () => Navigator.pop(context),
    );
  }
}
