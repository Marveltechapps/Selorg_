// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../setting_sections/Common widgets/button_large.dart';
// import '../bloc/cubit/suggestion_cubit.dart';
//
// class SuggestionsScreen extends StatelessWidget {
//   const SuggestionsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     bool mobile = width < 600;
//     return BlocProvider(
//       create: (_) => SuggestionsCubit(),
//       child: Material(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(1),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.grey.shade500,
//                   ),
//                   child: IconButton(
//                       onPressed: () => context.read<SuggestionsCubit>().close(),
//                       icon: const Icon(Icons.close)),
//                 )
//               ],
//             ),
//             Container(
//               padding: mobile
//                   ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
//                   : const EdgeInsets.symmetric(vertical: 14, horizontal: 128),
//               child: Column(
//                 children: [
//                   const Text("Suggest Products",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
//                   const SizedBox(height: 10),
//                   const Text(
//                       "Didn’t you find what you are looking for? Please suggest the products",
//                       textAlign: TextAlign.center),
//                   const SizedBox(height: 15),
//                   TextField(
//                     maxLines: mobile ? 4 : 2,
//                     keyboardType: TextInputType.text,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       filled: true,
//                       fillColor: Color(0xFFEFF1E7),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   LargeButton(
//                       text: "Send",
//                       onPressed: () =>
//                           context.read<SuggestionsCubit>().sendSuggestion())
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
