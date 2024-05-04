import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/ui/account/bloc/cubit/orders_cubit.dart';

import '../../../core/di/injector.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<OrdersCubit>(), child: const OrdersContent());
  }
}

class OrdersContent extends StatefulWidget {
  const OrdersContent({super.key});

  @override
  State<StatefulWidget> createState() => _OrdersContent();
}

class _OrdersContent extends State<OrdersContent> {
  late double screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Orders"),
          elevation: 4,
        ),
        body: Container(
            padding: EdgeInsets.only(
                left: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0,
                right: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0,
                top: 16.0,
                bottom: 16.0),
            child: _buildOrderList(context)));
  }

  Widget _buildOrderList(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return _buildOrderItem();
      },
    );
  }

  Widget _buildOrderItem() {
    return Card(
      elevation: 4,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Text(
                  "Tomato / Onion / Apple",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                Text("₹250")
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Text("Order #KDID768D78D"),
                    Text("22/07/2023 at 03:15pm")
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.green,
                  child: const Text(
                    "Delivered",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
