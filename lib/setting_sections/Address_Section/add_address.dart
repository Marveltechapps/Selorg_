import 'package:flutter/material.dart';

import '../Common widgets/title_bar.dart';
import 'added_success.dart';


class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleBar(text: "Add Address Details"),
            Container(
              padding: EdgeInsets.all(mobile ? 16 : 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mobile ? 350 : 450,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Lattice Bridge ",
                    style: TextStyle(
                        fontSize: mobile ? 18 : 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mobile
                            ? "10th Cross Street, ABC Nagar\nLattice Bridge, Adyar, Chennai"
                            : "10th Cross Street, ABC Nagar, Lattice Bridge, Adyar, Chennai",
                        style: TextStyle(
                          fontSize: mobile ? 15 : 20,
                        ),
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: mobile ? 12 : 14,
                                  color: Colors.black),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text(
                            "Change",
                            style: TextStyle(
                                fontSize: mobile ? 12 : 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text("House No. & Floor ", style: Style(mobile ? 16 : 22)),
                  const SizedBox(
                    height: 10,
                  ),
                  FormField("Enter Details", mobile ? 16 : 18),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Building & Block No. ", style: Style(mobile ? 16 : 22)),
                  const SizedBox(
                    height: 10,
                  ),
                  FormField("Enter Details", mobile ? 16 : 18),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Landmark & Area name(Optional) ",
                      style: Style(mobile ? 16 : 22)),
                  const SizedBox(
                    height: 10,
                  ),
                  FormField("Enter Details", mobile ? 16 : 18),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Add Address Label ", style: Style(mobile ? 16 : 22)),
                  const SizedBox(
                    height: 20,
                  ),
                  mobile
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButtonMobile("Home"),
                            SizedBox(
                              width: mobile ? width * 0.05 : width * 0.10,
                            ),
                            CustomButtonMobile("Work"),
                            SizedBox(
                              width: mobile ? width * 0.05 : width * 0.10,
                            ),
                            CustomButtonMobile("Other"),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButtonDesktop("Home"),
                            SizedBox(
                              width: width * 0.10,
                            ),
                            CustomButtonDesktop("Work"),
                            SizedBox(
                              width: width * 0.10,
                            ),
                            CustomButtonDesktop("Other"),
                          ],
                        ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddedSuccess()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAFB7AB),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: mobile ? width : width * 0.70,
                          decoration: BoxDecoration(
                              color: Color(0xFF034703),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(mobile ? 15 : 20))),
                          child: Text(
                            "Save and Continue ",
                            style: TextStyle(
                                fontSize: mobile ? 15 : 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle Style(double size) {
    return TextStyle(fontSize: size, fontWeight: FontWeight.bold);
  }

  Widget FormField(String hint, double size) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: size,
          )),
    );
  }

  Widget CustomButtonDesktop(String text) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          )),
    );
  }

  Widget CustomButtonMobile(String text) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          )),
    );
  }
}
