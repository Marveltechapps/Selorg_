import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../Common widgets/title_bar.dart';
import 'couper&offer.dart';

@RoutePage()
class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
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
            TitleBar(text: "Customer Support & FAQs"),
            //if (!mobile) const Divider(),
            Container(
                padding: mobile
                    ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                    : const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                child: Column(children: [
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
                              fontSize: mobile ? 16 : 18, color: Colors.white),
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
                              side: BorderSide(
                                  color: Colors.red.shade100, width: 2),
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
                  )
                ])),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FAQs",
                    style: TextStyle(
                        fontSize: mobile ? 16 : 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CoupenAndOffers()));
                      },
                      child: ContentList(
                        text: "Coupons & Offers",
                      )),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentList(
                    text: "Genral Inquiry",
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentList(text: "Payment Related"),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentList(text: "Feedback & Suggestions"),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentList(text: "Order / Products Related"),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ContentList extends StatelessWidget {
  ContentList({
    super.key,
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: mobile ? 16 : 18,
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: mobile ? 15 : 18,
        )
      ],
    );
  }
}
