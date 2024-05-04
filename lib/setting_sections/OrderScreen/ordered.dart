import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../Common widgets/title_bar.dart';
import 'order_cancelled.dart';
import 'order_detail.dart';

@RoutePage()
class OrderedScreen extends StatefulWidget {
  const OrderedScreen({super.key});

  @override
  State<OrderedScreen> createState() => _OrderedScreenState();
}

class _OrderedScreenState extends State<OrderedScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool mobile = width < 600;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.grey.shade300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleBar(text: "Order"),
                      // if (!mobile) const Divider(),
                      Container(
                        padding: mobile
                            ? const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16)
                            : const EdgeInsets.symmetric(
                                horizontal: 64, vertical: 16),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderDetails()));
                                },
                                child: OrderedItem(context)),
                            const Divider(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderCancel()));
                                },
                                child: Cancelleditem(context)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: width,
              child: Column(
                children: [
                  Card(
                    child: Container(
                      height: 70,
                      width: mobile ? width * 0.90 : width * 0.70,
                      child: ListTile(
                        isThreeLine: true,
                        leading: SizedBox(
                          width: mobile ? 25 : 40,
                          height: mobile ? 30 : 50,
                          child: Image.asset("assets/openlock_icon.png"),
                        ),
                        title: const Text(
                          'Yay! You’ve unlocked',
                        ),
                        subtitle: const Text(
                          'Free Delivery',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ), // Center text
                        trailing: Column(
                          children: [
                            Row(
                              // Rupee icon with text on the right
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: mobile ? 3 : 3,
                                        horizontal: mobile ? 8 : 12),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF034703),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Text('1/3',
                                        style: TextStyle(
                                            fontSize: mobile ? 16 : 18,
                                            color: Colors.white))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: mobile ? 8 : 16),
                    height: mobile ? 50 : 60,
                    width: mobile ? width * 0.90 : width * 0.70,
                    decoration: const BoxDecoration(
                        color: Color(0xFF034703),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1 Item | ₹92',
                            style: TextStyle(
                                fontSize: mobile ? 16 : 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('View Cart',
                            style: TextStyle(
                                fontSize: mobile ? 16 : 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget OrderedItem(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool mobile = width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Multigrain Atta",
                style: TextStyle(
                    fontSize: mobile ? 16 : 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "Rs.336",
                style: TextStyle(
                    fontSize: mobile ? 16 : 20, fontWeight: FontWeight.w400),
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
                "Order #C51D0CAYJ25824",
                style: TextStyle(fontSize: mobile ? 14 : 16),
              ),
              const Text(
                "",
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "01/12/23 at 03.27pm",
                style: TextStyle(fontSize: mobile ? 14 : 16),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                decoration: const BoxDecoration(
                    color: Color(0xFF00A85A),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Text(
                  "Delivery",
                  style: TextStyle(
                      fontSize: mobile ? 14 : 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Cancelleditem(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool mobile = width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Multigrain Atta",
                style: TextStyle(
                    fontSize: mobile ? 16 : 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "Rs.336",
                style: TextStyle(
                    fontSize: mobile ? 16 : 20, fontWeight: FontWeight.w400),
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
                "Order #C51D0CAYJ25824",
                style: TextStyle(fontSize: mobile ? 14 : 16),
              ),
              const Text(
                "",
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "01/12/23 at 03.27pm",
                style: TextStyle(fontSize: mobile ? 14 : 16),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: mobile ? width * 0.35 : width * 0.16,
                height: mobile ? 30 : 50,
                child: Center(
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(color: Colors.red.shade100, width: 2),
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
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: mobile ? 4 : 6, horizontal: mobile ? 24 : 32),
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
          )
        ],
      ),
    );
  }
}
