import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../Common widgets/title_bar.dart';
import 'add_address.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({super.key});

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
            // if (!mobile) const Divider(),
            Expanded(
              child: SizedBox(
                child: Center(
                  child: Container(
                    width: mobile ? width * 0.80 : width * 0.40,
                    height: height * 0.55,
                    padding: EdgeInsets.all(mobile ? 16 : 0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: mobile?100:150,
                            width: mobile ? width * 0.25 : width * 0.15,
                            child: Image.asset(
                              "assets/address_loc.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "No Address Added",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: mobile ? 16 : 20),
                          ),
                          SizedBox(
                            child: Text(
                              textAlign: TextAlign.center,
                              "To see the saved address here, add your work or home address",
                              style: TextStyle(fontSize: mobile ? 14 : 18),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddAddress()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFAFB7AB),
                                padding: const EdgeInsets.all(0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: mobile ? 40 : 50,
                                width: mobile ? width : width * 0.40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF034703),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(mobile ? 5 : 5))),
                                child: Text(
                                  "Add New Address",
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
            ),
          ],
        ),
      ),
    );
  }
}
