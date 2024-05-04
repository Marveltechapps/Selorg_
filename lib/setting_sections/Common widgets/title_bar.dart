import 'package:flutter/material.dart';

import 'appbar.dart';

class TitleBar extends StatelessWidget {
  TitleBar({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Container(
        padding: mobile
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
            : const EdgeInsets.symmetric(vertical: 14, horizontal: 64),
        alignment: mobile ? Alignment.center : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: mobile ? Color(0xFF034703) : Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black)),
        ),
        child: mobile
            ? MobileAppBar(
                text: text,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: Colors.black,
                      )),
                  const Spacer(),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: mobile ? 20 : 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Spacer(),
                ],
              )
        // : Text(
        //     text,
        //     style: TextStyle(
        //         fontSize: mobile ? 20 : 30,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.black),
        //   ),
        );
  }
}
