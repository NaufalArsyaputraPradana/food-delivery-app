import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Settings"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildDarkModeSwitch(context),
      ],
    );
  }

  Widget _buildDarkModeSwitch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(left: 25, top: 10, right: 25),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDarkModeText(context),
          _buildDarkModeSwitchWidget(context),
        ],
      ),
    );
  }

  Widget _buildDarkModeText(BuildContext context) {
    return Text(
      "Dark Mode",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }

  Widget _buildDarkModeSwitchWidget(BuildContext context) {
    return CupertinoSwitch(
      value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
      onChanged: (value) =>
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
    );
  }
}
