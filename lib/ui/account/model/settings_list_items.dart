import 'package:flutter/material.dart';

class ListItem {
  final IconData iconData;
  final String text;

  ListItem({required this.iconData, required this.text});
}

final List<ListItem> items = [
  ListItem(iconData: Icons.shopping_cart_rounded, text: "Orders"),
  ListItem(iconData: Icons.favorite_border, text: "Manage Referrals"),
  ListItem(iconData: Icons.message, text: "FAQ"),
  ListItem(iconData: Icons.location_on, text: "Address"),
  ListItem(iconData: Icons.message, text: "Refunds"),
  ListItem(iconData: Icons.account_circle, text: "Profile"),
  ListItem(iconData: Icons.notifications, text: "Suggest Products"),
  ListItem(iconData: Icons.info_outline, text: "General Info"),
  ListItem(iconData: Icons.notifications, text: "Notification")
];
