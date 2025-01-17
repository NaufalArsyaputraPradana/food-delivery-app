import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: _buildListTile(context, text, icon, textStyle, onTap),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String text,
    IconData? icon,
    TextStyle textStyle,
    void Function()? onTap,
  ) {
    return ListTile(
      title: Text(
        text,
        style: textStyle,
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      onTap: onTap,
    );
  }
}
