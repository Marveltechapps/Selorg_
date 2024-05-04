import 'package:flutter/material.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

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
              width: mobile ? width * 0.40 : width * 0.15,
              child: Image.asset(
                "assets/pay_fail_img.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Payment Failed",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: mobile ? 18 : 20),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("There was an error processing your payment."),
            const SizedBox(
              height: 15,
            ),
            const Text("If the problem persists, contact"),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "marveldesigner90@gmail.com",
              style: TextStyle(color: Color(0xFF3FBC5A)),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
                child: Container(
                  height: 40,
                  width: mobile ? width * 0.90 : width * 0.30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFF034703),
                      borderRadius:
                          BorderRadius.all(Radius.circular(mobile ? 8 : 10))),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
