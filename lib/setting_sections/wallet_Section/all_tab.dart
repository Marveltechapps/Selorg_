import 'package:flutter/material.dart';

class AllTabScreen extends StatelessWidget {
  const AllTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;
    return Container(
      padding: EdgeInsets.all(mobile ? 8 : 64),
      color: Colors.white,
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              mobile
                  ? MobileListContent(
                      Icons.card_giftcard_outlined,
                      "Selorg Cash - Valid for next order only",
                      "26/4/24 at 01:52 am",
                      "+100",
                      "Expires 24/1/25")
                  : DesktopListContent(
                      Icons.card_giftcard_outlined,
                      "Selorg Cash - Valid for next order only",
                      "26/4/24 at 01:52 am",
                      "+100",
                      "Expires 24/1/25"),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 20,
              ),
              mobile
                  ? MobileListContent(
                      Icons.info_outline,
                      "Gift Expired",
                      "26/4/24 at 01:52 am",
                      "+100",
                    )
                  : DesktopListContent(
                      Icons.info_outline,
                      "Gift Expired",
                      "26/4/24 at 01:52 am",
                      "+100",
                    ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 20,
              ),
              mobile
                  ? MobileListContent(
                      Icons.card_giftcard_outlined,
                      "Selorg Cash",
                      "26/4/24 at 01:52 am",
                      "+100",
                      "Expires 24/1/25")
                  : DesktopListContent(
                      Icons.card_giftcard_outlined,
                      "Selorg Cash",
                      "26/4/24 at 01:52 am",
                      "+100",
                      "Expires 24/1/25"),
            ],
          ),
        ),
      ),
    );

//  ListTile(
//             isThreeLine: true,
//             minVerticalPadding: BorderSide.strokeAlignCenter,
//             leading: Icon(Icons.cabin_outlined),
//             title: Text(
//               "Selorg Cash - Valid for next order only",
//               style: TextStyle(fontSize: 23),
//             ),
//             subtitle: Text(
//               "26/4/24 at 01:52 am",
//               style: TextStyle(fontSize: 20),
//             ),
//             trailing: Column(
//               children: [
//                 Text(
//                   "+100",
//                   style: TextStyle(color: Colors.green, fontSize: 20),
//                 ),
//                 Text(
//                   "Expires 24/1/25",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
  }

  Widget DesktopIconWithText(
    IconData icon,
    String text,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(width: 8.0), // Add some space between icon and text
        Text(
          text,
          style: const TextStyle(
              fontSize: 23, fontWeight: FontWeight.w600, letterSpacing: 0),
        ),
      ],
    );
  }

  Widget DesktopListContent(
      IconData icon, String title, String subtitle, String cash,
      [String? valid]) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DesktopIconWithText(
              icon,
              title,
            ),
            Text(
              cash,
              style: const TextStyle(color: Colors.green, fontSize: 20),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subtitle,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              valid ?? "",
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Widget MobileIconWithText(
    IconData icon,
    String text,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(width: 1.0), // Add some space between icon and text
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0),
        ),
      ],
    );
  }

  Widget MobileListContent(
      IconData icon, String title, String subtitle, String cash,
      [String? valid]) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MobileIconWithText(
              icon,
              title,
            ),
            Text(
              cash,
              style: const TextStyle(color: Colors.green, fontSize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              valid ?? "",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
