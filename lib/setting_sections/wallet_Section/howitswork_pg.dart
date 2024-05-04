import 'package:flutter/material.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 125,
              width: mobile ? 50 : 60,
              child: Image.asset(
                "assets/how_it_work.png",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "How it works",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: mobile ? 18 : 20),
            ),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "1",
                text:
                    "Selorg  cash is a wallet service offered by the company to its customers, which can be used for purchase of products untills expiry.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "2",
                text:
                    "Selorg  cash invalid for 12 months from the date of issue unless specified a validity period. Selorg cash is not refundable.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "3",
                text:
                    "Selorg  cash can be usedin such cities where issuing company is operating and shall be subject to platform terms of use and application laws.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "4",
                text:
                    "You canpurchase Selorg Cash using any available payment methods. You can also redeem vouchers to add Selorg Cash into your wallet.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "5",
                text:
                    "For any further question/queries,the customer may reach out to marveldesigner90@gmail.com",
                context: context),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget contentStep(
      {required String no,
      required String text,
      required BuildContext context}) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0xFF034703), shape: BoxShape.circle),
            child: Text(
              no,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: mobile ? 5 : 10,
          ),
          Expanded(
              child: Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(overflow: TextOverflow.visible),
          ))
        ],
      ),
    );
  }
}
