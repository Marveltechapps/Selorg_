import 'package:flutter/material.dart';

import '../Common widgets/title_bar.dart';


class OrderCancel extends StatefulWidget {
  const OrderCancel({super.key});

  @override
  State<OrderCancel> createState() => _OrderCancelState();
}

class _OrderCancelState extends State<OrderCancel> {
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
            TitleBar(text: "Order"),
            // if (!mobile) const Divider(),
            Container(
              color: mobile ? Colors.white : Colors.grey.shade300,
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ORDER ID: C51D0CAYJ25824",
                        style: TextStyle(
                          fontSize: mobile ? 15 : 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: mobile ? 4 : 6,
                            horizontal: mobile ? 24 : 32),
                        decoration: const BoxDecoration(
                            color: Color(0xFF7B8681),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          "Cancelled",
                          style: TextStyle(
                              fontSize: mobile ? 16 : 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mobile ? 0 : 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Placed on 01/12/23 at 03.27pm",
                        style: TextStyle(
                          fontSize: mobile ? 14 : 16,
                        ),
                      ),
                      const Text(
                        "",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              color: Color(0xFF00A85A),
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Order Cancelled",
                    style: TextStyle(
                        fontSize: mobile ? 18 : 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Your payment was not completed. Any amount if Debited will get refunded within 3-5 days. Please try placing the order again.",
                    style: TextStyle(
                        fontSize: mobile ? 14 : 18,
                        color: Colors.white,
                        height: 1.5),
                  ),
                ],
              ),
            ),
            Container(
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 16, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              alignment: mobile ? Alignment.centerLeft : Alignment.center,
              color: mobile ? Colors.white : Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: mobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: mobile ? width * 0.35 : width * 0.20,
                    height: mobile ? 30 : 50,
                    child: Center(
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color:  Color.fromARGB(255, 250, 108, 122), width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xFFE54444),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                Text(
                                  "Reorder",
                                  style: TextStyle(
                                    fontSize: mobile ? 14 : 16,
                                    color: const Color(0xFFE54444),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: mobile ? 1 : 2,
                    color: mobile ? Colors.grey : Colors.black,
                  ),
                  SizedBox(
                    height: mobile ? 0 : 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.60,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            mobile
                                ? Container(
                                    alignment: Alignment.center,
                                    width: width * 0.15,
                                    height: 100,
                                    child: Image.asset(
                                      "assets/order_bowl.png",
                                      fit: BoxFit.fill,
                                      width: width * 0.09,
                                      height: 60,
                                    ))
                                : SizedBox(
                                    width: width * 0.10,
                                    height: 85,
                                    child: Image.asset(
                                      "assets/order_bowl.png",
                                      fit: BoxFit.fill,
                                    )),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Multigrain Atta",
                                  style: TextStyle(
                                      fontSize: mobile ? 14 : 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "5 kg ~ Qty: 1",
                                  style: TextStyle(
                                      fontSize: mobile ? 14 : 16,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Rs.336",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Rs.376",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 1),
                    color: Colors.white,
                    spreadRadius: 1)
              ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item Total ",
                        style: TextStyle(
                            fontSize: mobile ? 15 : 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹376",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "₹336",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Handling charge ",
                        style: TextStyle(
                            fontSize: mobile ? 15 : 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹15",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "₹05",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: TextStyle(
                            fontSize: mobile ? 15 : 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹35",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To Pay",
                        style: TextStyle(
                            fontSize: mobile ? 16 : 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹336",
                            style: TextStyle(
                                fontSize: mobile ? 14 : 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
