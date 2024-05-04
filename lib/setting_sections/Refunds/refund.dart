import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../Common widgets/appbar.dart';
import '../Common widgets/title_bar.dart';

@RoutePage()
class RefundScreen extends StatelessWidget {
  const RefundScreen({super.key});

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
            TitleBar(text: "Refund"),
            Container(
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 14, horizontal: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Active",
                    style: TextStyle(
                        fontSize: mobile ? 18 : 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(mobile ? 16 : 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "02/11/23 at 10:20pm",
                                style: TextStyle(
                                    fontSize: mobile ? 17 : 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 250, 187, 201),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3))),
                                child: Text(
                                  "In Progress",
                                  style: TextStyle(
                                      fontSize: mobile ? 15 : 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 252, 60, 60)),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Order ID. 8GED4BBHQ80037 - ₹37",
                            style: TextStyle(
                                fontSize: mobile ? 16 : 20,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: mobile ? 20 : 25,
                                width: mobile ? 20 : 25,
                                child: Image.asset(
                                  "assets/clock_icon.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Text(
                                "02/11/23 at 10:20pm",
                                style: TextStyle(
                                    fontSize: mobile ? 17 : 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const Spacer()
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "28/01/23",
                            style: TextStyle(
                                fontSize: mobile ? 15 : 18,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Color(0xFF034703), width: 1.5)),
                              child: Text(
                                "View Order Details",
                                style: TextStyle(
                                    fontSize: mobile ? 15 : 18,
                                    color: Color(0xFF034703)),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "-LESS",
                            style: TextStyle(
                                fontSize: mobile ? 15 : 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF034703)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Active",
                    style: TextStyle(
                        fontSize: mobile ? 18 : 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(mobile ? 16 : 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "02/11/23 at 10:20pm",
                                style: TextStyle(
                                    fontSize: mobile ? 17 : 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 206, 253, 206),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3))),
                                child: Text(
                                  "Completed",
                                  style: TextStyle(
                                      fontSize: mobile ? 15 : 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF034703)),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Order ID. 8GED4BBHQ80037 - ₹37",
                            style: TextStyle(
                                fontSize: mobile ? 16 : 20,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "-MORE",
                            style: TextStyle(
                                fontSize: mobile ? 15 : 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF034703)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
