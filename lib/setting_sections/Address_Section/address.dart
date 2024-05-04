import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Common widgets/title_bar.dart';
import 'add_address.dart';
import 'delete_address.dart';

class AddressSetScreen extends StatefulWidget {
  const AddressSetScreen({super.key});

  @override
  State<AddressSetScreen> createState() => _AddressSetScreenState();
}

class _AddressSetScreenState extends State<AddressSetScreen> {
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
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 12, horizontal: 12)
                  : const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              width: width,
              child: ListView(shrinkWrap: true, children: [
                ListTile(
                  leading: Icon(
                    Icons.location_on_outlined,
                    size: mobile ? 30 : 40,
                  ),
                  title: Text(
                    "Other",
                    style: TextStyle(
                      fontSize: mobile ? 16 : 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "13, 8/22,Gandhi Rd, Nehru Nagar, Chennai, Ta...",
                    style: TextStyle(
                      fontSize: mobile ? 14 : 20,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            size: mobile ? 25 : 35,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DeleteAddress()));
                          },
                          icon: Icon(
                            Icons.delete_outlined,
                            size: mobile ? 25 : 35,
                          ))
                    ],
                  ),
                ),
              ]),
            ),
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
                      builder: (context) => const AddAddress()));
                },
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
                child: Container(
                  height: mobile ? 40 : 50,
                  width: mobile ? width * 0.90 : width * 0.40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFF034703),
                      borderRadius:
                          BorderRadius.all(Radius.circular(mobile ? 20 : 25))),
                  child: Text(
                    "Add New Address",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mobile ? 16 : 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
