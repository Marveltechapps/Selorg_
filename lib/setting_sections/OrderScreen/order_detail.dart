import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Common widgets/title_bar.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
                    : const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
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
                              vertical: mobile ? 6 : 8,
                              horizontal: mobile ? 24 : 32),
                          color: Color(0xFF00A85A),
                          child: Text(
                            "Delivery",
                            style: TextStyle(
                                fontSize: mobile ? 16 : 18,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                side:const BorderSide(
                                    color: Color.fromARGB(255, 250, 108, 122), width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xFFE54444),
                                ),
                                Text(
                                  "Reorder",
                                  style: TextStyle(
                                    fontSize: mobile ? 14 : 16,
                                    color: const Color(0xFFE54444),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(),
                    SizedBox(
                      height: mobile ? 5 : 20,
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
                                        width: width * 0.08,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
              // const SizedBox(
              //   height: 25,
              // ),
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
      ),
    );
  }
}
