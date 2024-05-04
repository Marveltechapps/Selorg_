import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../Common widgets/title_bar.dart';

@RoutePage()
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TitleBar(text: "Order"),
            // if (!mobile) const Divider(),
            Expanded(
              child: SizedBox(
                child: Container(
                  width: mobile ? width * 0.80 : width * 0.30,
                  height: height * 0.50,
                  padding: EdgeInsets.all(mobile ? 16 : 0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: mobile ? 100 : 125,
                          width: mobile ? width * 0.25 : width * 0.15,
                          child: Image.asset(
                            "assets/order_icon.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            textAlign: TextAlign.center,
                            "No orders placed yet. Start exploring and items to your cart !",
                            style: TextStyle(fontSize: mobile ? 14 : 18),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFAFB7AB),
                              padding: const EdgeInsets.all(0),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              height: mobile ? 40 : 50,
                              width: mobile ? width : width * 0.30,
                              decoration: BoxDecoration(
                                  color: Color(0xFF034703),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(mobile ? 5 : 5))),
                              child: Text(
                                "Browser Now",
                                style: TextStyle(
                                    fontSize: mobile ? 15 : 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
