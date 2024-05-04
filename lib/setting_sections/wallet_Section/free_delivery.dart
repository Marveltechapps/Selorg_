import 'package:flutter/material.dart';

class FreeDelivery extends StatelessWidget {
  const FreeDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Free Delivery",
                style: TextStyle(
                    fontSize: mobile ? 17 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 135, 248, 116),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Text(
                  "No Code Required",
                  style: TextStyle(
                      fontSize: mobile ? 12 : 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF258B14)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Order worth \$159 and get free delivery",
            style: TextStyle(
                fontSize: mobile ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF666666)),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.grey.shade400,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    "assets/percent_icon.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                Text(
                  "Add items worth ₹54 to get free delivery",
                  style: TextStyle(
                      fontSize: mobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF666666)),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Terms & Conditions",
            style: TextStyle(
                fontSize: mobile ? 17 : 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Valid on order above ₹99",
            style: TextStyle(
                fontSize: mobile ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF666666)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Other terms and condition may apply",
            style: TextStyle(
                fontSize: mobile ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF666666)),
          ),
        ],
      ),
    );
  }
}
