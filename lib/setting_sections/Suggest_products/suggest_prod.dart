import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../Common widgets/button_large.dart';

@RoutePage()
class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;
    return Material(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade500,
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close)),
              )
            ],
          ),
          Container(
            padding: mobile
                ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                : const EdgeInsets.symmetric(vertical: 14, horizontal: 128),
            child: Column(
              children: [
                Text("Suggest Products",
                    style: TextStyle(
                        fontSize: mobile ? 18 : 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "Didn’t you find what you are looking for? Please suggest the products",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: mobile ? 16 : 20,
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  maxLines: mobile ? 3 : 2,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFEFF1E7),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                LargeButton(
                  text: "Send",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void suggestionBottom(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade500,
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close)),
                    )
                  ],
                ),
                Container(
                  padding: mobile
                      ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                      : const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 128),
                  child: Column(
                    children: [
                      Text("Suggest Products",
                          style: TextStyle(
                              fontSize: mobile ? 18 : 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Didn’t you find what you are looking for? Please suggest the products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: mobile ? 16 : 20,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        maxLines: mobile ? 4 : 2,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xFFEFF1E7),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LargeButton(
                        text: "Send",
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ));
  }

  void thankYouBottom(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: mobile
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
            : const EdgeInsets.symmetric(vertical: 14, horizontal: 128),
        child: Column(
          children: [
            Text("Thank You!",
                style: TextStyle(
                    fontSize: mobile ? 18 : 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: mobile ? 40 : 70,
              height: mobile ? 50 : 70,
              child: Image.asset(
                "assets/cone_img.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("We’ve received your suggestion.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mobile ? 16 : 20,
                )),
            const SizedBox(
              height: 10,
            ),
            LargeButton(
              text: "Done",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
