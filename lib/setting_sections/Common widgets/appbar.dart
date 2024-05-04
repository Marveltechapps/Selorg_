import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  MobileAppBar({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.white,
            )),
        const Spacer(),
        Text(
          text,
          style: TextStyle(
              fontSize: mobile ? 20 : 30,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        const Spacer(),
      ],
    );
  }
}
