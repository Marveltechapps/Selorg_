import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../ui/account/pages/address_page.dart';
import 'address.dart';

class AddedSuccess extends StatelessWidget {
  const AddedSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: mobile ? 150 : 200,
                      width: mobile ? width * 0.35 : width * 0.20,
                      child: Image.asset(
                        "assets/right_icon.png",
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your address has been saved",
                    style: TextStyle(
                        fontSize: mobile ? 16 : 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding: mobile
                        ? const EdgeInsets.symmetric(
                            vertical: 24,
                          )
                        : const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddressSetScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        child: Container(
                          height: mobile ? 40 : 50,
                          width: mobile ? width * 0.90 : width * 0.40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xFF034703),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(mobile ? 20 : 25))),
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: mobile ? 16 : 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
