// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/cubit/ordered_cubit.dart';
// import '../bloc/state/ordered_state.dart';
//
// class OrderedScreenBloc extends StatelessWidget {
//   const OrderedScreenBloc({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(v
//       create: (context) => OrderedCubit()..loadOrders(),
//       child: BlocBuilder<OrderedCubit, OrderedState>(
//         builder: (context, state) {
//           if (state is OrderedLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is OrderedLoaded) {
//             return buildLoadedScreen(context, state.orders);
//           } else if (state is OrderedError) {
//             return Center(child: Text(state.message));
//           }
//           return const Center(child: Text('Initial State'));
//         },
//       ),
//     );
//   }
//
//   Widget buildLoadedScreen(BuildContext context, List<String> orders) {
//     double width = MediaQuery.of(context).size.width;
//     bool mobile = width < 600;
//
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: mobile ? 16 : 64,
//                   vertical: 16,
//                 ),
//                 itemCount: orders.length,
//                 itemBuilder: (context, index) {
//                   final order = orders[index];
//                   return ListTile(
//                     title: Text(order),
//                     onTap: () {
//                       // Implement navigation or further interaction
//                     },
//                   );
//                 },
//               ),
//             ),
//             // Additional UI elements as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
