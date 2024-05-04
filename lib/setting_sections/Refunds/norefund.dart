import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Common widgets/title_bar.dart';

class NoRefundPage extends StatelessWidget {
  const NoRefundPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TitleBar(
            text: "Refunds",
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(mobile ? 16 : 32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Refunds",
                    style: TextStyle(
                        fontSize: mobile ? 20 : 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "You have  no active or past refunds.",
                    style: TextStyle(
                        fontSize: mobile ? 20 : 35, color: Colors.black),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    ));
  }
}
