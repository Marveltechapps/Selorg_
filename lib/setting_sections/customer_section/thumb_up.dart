import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Common widgets/title_bar.dart';

class ThumbUpScreen extends StatefulWidget {
  const ThumbUpScreen({super.key});

  @override
  State<ThumbUpScreen> createState() => _ThumbUpScreenState();
}

class _ThumbUpScreenState extends State<ThumbUpScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleBar(text: "Coupons & Offers"),
            Container(
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coupon not working/expired coupon",
                    style: TextStyle(
                      fontSize: mobile ? 16 : 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      "Every Coupon Comes with a validity and if the validity os over you cannot use the coupon. But there are more coupons coming your way through our various promotions! Keep checking the ‘ View Coupons & Offers” tab on the cart page for more offers.",
                      style: TextStyle(fontSize: mobile ? 16 : 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Have a non-urgent question or comment?",
                    style: TextStyle(
                      fontSize: mobile ? 16 : 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email ",
                    style: TextStyle(fontSize: mobile ? 16 : 18, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: mobile
                  ? const EdgeInsets.symmetric(vertical: 0, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              height: 150,
              width: mobile ? width : width * 0.80,
              decoration: BoxDecoration(
                  color: mobile
                      ? const Color(0xFFF0F0F0)
                      : const Color(0xFFD5DCBD),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Thank you for sharing the feedback",
                    style: TextStyle(
                        fontSize: mobile ? 18 : 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mobile ? 30 : 40,
                        child: Image.asset(
                          "assets/thumb_up.png",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: mobile ? 30 : 40,
                          child: Image.asset("assets/thumb_down.png")),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
