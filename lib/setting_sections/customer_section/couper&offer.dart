import 'package:flutter/material.dart';
import '../Common widgets/title_bar.dart';
import 'customer_support.dart';

class CoupenAndOffers extends StatefulWidget {
  const CoupenAndOffers({super.key});

  @override
  State<CoupenAndOffers> createState() => _CoupenAndOffersState();
}

class _CoupenAndOffersState extends State<CoupenAndOffers> {
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
              TitleBar(text: "FAQs"),
              Container(
                padding: mobile
                    ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                    : const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coupons & Offers",
                      style: TextStyle(
                        fontSize: mobile ? 16 : 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    ContentList(text: "Coupon not working /expired coupon"),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    ContentList(
                        text: mobile
                            ? "I forgot to apply my coupon code. \nwhat do I do now?"
                            : "I forgot to apply my coupon code. what do I do now?"),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    ContentList(text: "How do I refer my friend?"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
