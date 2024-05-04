// import 'package:flutter/material.dart';
//
// import '../Common widgets/title_bar.dart';
//
// class GeneralPolicy extends StatelessWidget {
//   const GeneralPolicy({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     bool mobile = width < 600;
//     return Scaffold(
//       body: Column(
//         children: [
//           TitleBar(text: "Policies"),
//           Container(
//             alignment: Alignment.centerLeft,
//             padding: mobile
//                 ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
//                 : const EdgeInsets.symmetric(vertical: 64, horizontal: 64),
//             child: Column(
//               children: [
//                 Policy(context, "assets/note_icon.png", "Terms & Conditions"),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Policy(context, "assets/lock_icon.png", "Privacy Policy"),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Policy(context, "assets/open_icon.png", "Open Source Licence"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget Policy(BuildContext context, String icon, String text) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     bool mobile = width < 600;
//     return Container(
//         height: mobile ? 40 : 65,
//         width: mobile ? width * 0.90 : width * 0.60,
//         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         decoration: const BoxDecoration(
//             color: Color(0xFFFFFFFF),
//             borderRadius: BorderRadius.all(Radius.circular(5))),
//         child: Row(
//           children: [
//             SizedBox(
//                 height: mobile ? 30 : 35,
//                 width: mobile ? 30 : 35,
//                 child: Image.asset(icon)),
//             const SizedBox(
//               width: 15,
//             ),
//             Text(
//               text,
//               style: TextStyle(
//                   fontSize: mobile ? 17 : 21,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black),
//             ),
//           ],
//         ));
//   }
// }
