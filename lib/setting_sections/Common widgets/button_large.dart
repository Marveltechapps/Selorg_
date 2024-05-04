import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  LargeButton({super.key, required this.text, required Function() onPressed});
  String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Container(
      padding: mobile
          ? const EdgeInsets.symmetric(
              vertical: 24,
            )
          : const EdgeInsets.symmetric(
              vertical: 24,
            ),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
          child: Container(
            height: mobile ? 40 : 50,
            width: mobile ? width * 0.90 : width * 0.40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xFF034703),
                borderRadius:
                    BorderRadius.all(Radius.circular(mobile ? 20 : 25))),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: mobile ? 16 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}
