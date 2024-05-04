// import 'package:flutter/material.dart';
//
// import '../Common widgets/title_bar.dart';
//
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   bool on = false;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     bool mobile = width < 600;
//     return Scaffold(
//       body: Column(
//         children: [
//           TitleBar(text: "Notifications"),
//           SizedBox(
//             height: mobile ? 0 : 15,
//           ),
//           Container(
//             width: mobile ? width : width * 0.90,
//             height: mobile ? 60 : 80,
//             padding: EdgeInsets.all(mobile ? 8 : 12),
//             decoration: const BoxDecoration(
//               color: Color(0xFFFFFFFF),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "WhatsApp  Messages",
//                       style: TextStyle(
//                           fontSize: mobile ? 16 : 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black),
//                     ),
//                     Text(
//                       "Get updates from us on WhatsApp",
//                       style: TextStyle(fontSize: mobile ? 14 : 17),
//                     ),
//                   ],
//                 ),
//                 Switch(
//                   value: on,
//                   onChanged: (value) {
//                     setState(() {
//                       on = value;
//                     });
//                   },
//                   activeColor: Color(0xFF034703),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
