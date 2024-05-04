import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/router/app_router.dart';
import '../../../networking/models/account/address_response.dart';
import '../bloc/cubit/account_cubit.dart';
import '../bloc/state/account_state.dart';
import '../models/cart_item.dart';

class WebNavigationBar extends StatefulWidget {
  final Address? address;
  const WebNavigationBar({super.key, this.address});

  @override
  State<WebNavigationBar> createState() => _WebNavigationBarState();
}

class _WebNavigationBarState extends State<WebNavigationBar> {
  late AccountCubit accountCubit;

  bool isAddressAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          color: const Color(0xFF034703),
          child: Row(
            children: [
              const Gap(32.0),
              SvgPicture.asset("assets/ic_dashboard_logo.svg"),
              const Gap(16.0),
              GestureDetector(
                onTap: () {
                  // Define the navigateAddress function or replace with your implementation
                },
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.address?.label} - ${widget.address?.address1}, ${widget.address?.address2}...",
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.white),
                          ),
                          const Gap(8.0),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Gap(16.0),

              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search For Products",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white, width: 0),
                    //   borderRadius: BorderRadius.circular(30.0),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              const Gap(16.0),
              PopupMenuButton(
                tooltip: "My Account",
                child: BlocListener<AccountCubit, AccountState>(
                  listener: (context, state) {
                    if (state is AccountLogOut) {
                      context.router.replaceAll([const LoginRoute()]);
                    }
                  },
                  child: const Text("My Account",
                      style: TextStyle(color: Colors.white)),
                ),
                onSelected: (value) {
                  switch (value) {
                    case "/profile":
                      context.router.push(const ProfileRoute());
                      break;
                    case "/orders":
                      context.router.push(const OrdersRoute());
                      break;
                    case "/saved_address":
                      context.router.push(AddressRoute(isSelection: false));
                      break;
                    case "/refunds":
                      context.router.push(const RefundRoute());
                      break;
                    case "/logout":
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text(
                                    "Do you really want to log out from the app ?"),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Okay'),
                                    onPressed: () {
                                      accountCubit.logOut();
                                    },
                                  ),
                                ],
                              ));
                      break;
                  }
                },
                itemBuilder: (BuildContext bc) {
                  return [
                    const PopupMenuItem(
                      value: '/profile',
                      child: ListTile(
                          title: Text("Profile"),
                          leading:
                              Icon(Icons.person_outline, color: Colors.green)),
                    ),
                    const PopupMenuItem(
                      value: '/orders',
                      child: ListTile(
                          title: Text("Orders"),
                          leading:
                              Icon(Icons.shopping_bag, color: Colors.green)),
                    ),
                    const PopupMenuItem(
                      value: '/saved_address',
                      child: ListTile(
                          title: Text("Saved address"),
                          leading:
                              Icon(Icons.location_city, color: Colors.green)),
                    ),
                    const PopupMenuItem(
                      value: '/refunds',
                      child: ListTile(
                          title: Text("Refunds"),
                          leading: Icon(Icons.money, color: Colors.green)),
                    ),
                    const PopupMenuItem(
                      value: '/logout',
                      child: ListTile(
                          title: Text("Log out"),
                          leading: Icon(Icons.logout, color: Colors.green)),
                    )
                  ];
                },
              ),
              const Gap(16.0),
              ValueListenableBuilder(
                valueListenable: Hive.box<CartItem>("cart_items").listenable(),
                builder: (context, box, child) {
                  return box!.values.isNotEmpty
                      ? ElevatedButton.icon(
                          onPressed: () {
                            context.tabsRouter.setActiveIndex(1);
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: Column(
                            children: [
                              const Text("My Cart"),
                              Text("${box.values.length} items")
                            ],
                          ))
                      : ElevatedButton.icon(
                          onPressed: () {
                            context.tabsRouter.setActiveIndex(1);
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("My Cart"));
                },
              ),
              const Gap(32.0)
              // Continue with the rest of your widget code...
            ],
          ),
        )
      ],
    );
  }
}
