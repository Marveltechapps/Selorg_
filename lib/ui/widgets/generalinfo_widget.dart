import 'package:flutter/material.dart';

class PolicyWidget extends StatelessWidget {
  final String icon;
  final String text;
  final bool mobile;

  const PolicyWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.mobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mobile ? 40 : 65,
      width: mobile
          ? MediaQuery.of(context).size.width * 0.90
          : MediaQuery.of(context).size.width * 0.60,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          SizedBox(
              height: mobile ? 30 : 35,
              width: mobile ? 30 : 35,
              child: Image.asset(icon)),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
                fontSize: mobile ? 17 : 21,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
