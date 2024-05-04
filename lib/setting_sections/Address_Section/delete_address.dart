import 'package:flutter/material.dart';
import '../Common widgets/appbar.dart';
import '../Common widgets/button_large.dart';
import '../Common widgets/title_bar.dart';

class DeleteAddress extends StatelessWidget {
  const DeleteAddress({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TitleBar(text: "Address"),
          Expanded(
              child: Container(
            child: Center(
              child: Container(
                // padding: mobile
                //     ? const EdgeInsets.symmetric(
                //         vertical: 24,
                //       )
                //     : const EdgeInsets.symmetric(
                //         vertical: 24,
                //       ),
                height: mobile ? 40 : 50,
                width: mobile ? width * 0.90 : width * 0.40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: const Color(0xFF034703),
                ),
                child: Text(
                  "Your address has been deleted",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mobile ? 16 : 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //         padding: const EdgeInsets.all(0)),
                //     child: Container(
                //       height: mobile ? 40 : 50,
                //       width: mobile ? width * 0.90 : width * 0.40,
                //       alignment: Alignment.center,
                //       decoration: const BoxDecoration(
                //         color: const Color(0xFF034703),
                //       ),
                //       child: Text(
                //         "Your address has been deleted",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: mobile ? 16 : 22,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     )),
              ),
            ),
          )),
          LargeButton(
            text: "Add New Address",
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
