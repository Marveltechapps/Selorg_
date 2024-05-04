import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/core/utils/dialog_utils.dart';
import 'package:sel_org/core/utils/dimens.dart';
import 'package:sel_org/ui/dashboard/bloc/cubit/cart_cubit.dart';
import 'package:sel_org/ui/dashboard/models/cart_item.dart';
import 'package:sel_org/ui/account/pages/settings_page.dart';
import '../../../networking/models/account/address_response.dart';
import '../../account/bloc/cubit/address_cubit.dart';
import '../../account/bloc/state/address_state.dart';
import '../../widgets/buttons.dart';
import '../bloc/cubit/account_cubit.dart';
import '../bloc/cubit/category_cubit.dart';
import '../bloc/state/account_state.dart';
import '../bloc/state/cart_state.dart' as cart_state;
import '../bloc/state/cart_state.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (BuildContext context) => getIt<CategoryCubit>(),
        ),
        BlocProvider<AddressCubit>(
          create: (BuildContext context) => getIt<AddressCubit>(),
        ),
        BlocProvider<AccountCubit>(
          create: (BuildContext context) => getIt<AccountCubit>(),
        ),
        BlocProvider<CartCubit>(
          create: (BuildContext context) => getIt<CartCubit>(),
        ),
      ],
      child: const CartScreenContent(),
    );
  }
}

class CartScreenContent extends StatefulWidget {
  const CartScreenContent({super.key});

  @override
  State<StatefulWidget> createState() => _CartScreenContent();
}

class _CartScreenContent extends State<CartScreenContent>
    with WidgetsBindingObserver {
  late CartCubit cartCubit;
  double totalPrice = 0.0;
  double totalMrpPrice = 0.0;
  double handlingCharge = 5.0;
  double deliveryCharge = 25.0;
  String address = "Loading default address...";
  bool isCartEmpty = false;
  late double screenSize;
  late CategoryCubit categoryCubit;
  late AddressCubit addressCubit;
  late AccountCubit accountCubit;
  bool isAddressAvailable = false;
  int count = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (!isAddressAvailable) {
          addressCubit.getAddress(false);
        }
        break;
      case AppLifecycleState.inactive:
        // widget is inactive
        break;
      case AppLifecycleState.paused:
        // widget is paused
        break;
      case AppLifecycleState.detached:
        // widget is detached
        break;
      case AppLifecycleState.hidden:
    }
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    categoryCubit = context.read<CategoryCubit>();
    addressCubit = context.read<AddressCubit>();
    accountCubit = context.read<AccountCubit>();
    addressCubit.getDefaultAddress();
    cartCubit = context.read<CartCubit>();
    cartCubit.getDefaultAddress();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state is AddressLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DefaultAddressLoaded) {
              Address? address = (state).address;
              if (address != null) {
                isAddressAvailable = true;
                categoryCubit.getCategory();
              } else {
                isAddressAvailable = false;
              }

              return kIsWeb && screenSize >= 640
                  ? getWebNavigationBar(context, address)
                  : AppBar(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF034703),
                      title: const Text("Cart"),
                      leading: IconButton(
                        onPressed: () {
                          context.tabsRouter.setActiveIndex(0);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search))
                      ],
                    );
            } else
              return Container();
          },
          listener: (BuildContext context, AddressState state) {
            if (state is AddressEmpty) {
              isAddressAvailable = false;
              context.showSuccessDialog(
                  "Address not available",
                  "Please add your address to see the products and offers near you.",
                  navigateAddAddress);
            }
          },
        ),
        // Visibility(
        //   visible: screenSize >= 640 && kIsWeb,
        //   child: AppBar(
        //     title: const Text("Cart"),
        //     leading: BackButton(
        //       onPressed: () => context.router.pop(),
        //     ),
        //   ),
        // ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<CartItem>("cart_items").listenable(),
            builder: (context, Box<CartItem> box, child) {
              if (box.values.isEmpty) {
                isCartEmpty = true;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRect(
                          child: Image.asset("assets/shopping-cart_.png"),
                        ),
                        const Gap(16),
                        const Text(
                          "Your cart is Empty",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        const Gap(16.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), // Set borderRadius to zero for rectangular corners
                              ),
                            ),
                            onPressed: () {
                              context.router.pop();
                            },
                            child: const Text("Browse products"))
                      ],
                    ),
                  ),
                );
              } else {
                isCartEmpty = false;
              }
              calculateTotalPrice(box.values.toList());
              return Padding(
                padding: EdgeInsets.only(
                    left: context.getPadding(), right: context.getPadding()),
                child: ListView(children: <Widget>[
                  const Gap(16.0),
                  const Text(
                    "Cart Items",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8.0),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        return _buildCartItem(box.getAt(index), index, box);
                      }),
                  const Gap(16.0),
                  const Text("Bill Summary",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const Gap(8.0),
                  Card(
                      elevation: 4,
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.white),
                          children: [
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Cart Total"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("₹$totalPrice",
                                    textAlign: TextAlign.end),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Handling Charge",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("₹$handlingCharge",
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(color: Colors.grey.shade400)),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("Delivery Charge",
                                    style:
                                        TextStyle(color: Colors.grey.shade400)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("₹$deliveryCharge",
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(color: Colors.grey.shade400)),
                              ),
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Total Bill",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "₹${(totalPrice + handlingCharge + deliveryCharge).toStringAsFixed(0)}",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                          ],
                        ),
                      ))
                ]),
              );
            },
          ),
        ),
        BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is cart_state.AddressLoaded) {
              final savedAddress = state.address;
              setState(() {
                address =
                    "${savedAddress?.label} - ${savedAddress?.address1}, ${savedAddress?.address2}, ${savedAddress?.street}, ${savedAddress?.city}...";
              });
            }
          },
          child: isCartEmpty
              ? Container()
              : Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: context.getPadding(),
                        right: context.getPadding()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(8.0),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Delivery address: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                            TextSpan(
                                text: address,
                                style: const TextStyle(color: Colors.grey))
                          ]),
                        ),
                        const Gap(8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text("To Pay",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0),
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2),
                                Text(
                                  "₹${(totalPrice + handlingCharge + deliveryCharge).toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child:
                                  NormalFilledButton("Continue to payment", () {
                                navigateToPayment();
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  void calculateTotalPrice(List<CartItem> cartItems) {
    totalPrice = 0.0;
    totalMrpPrice = 0.0;
    for (var element in cartItems) {
      totalPrice =
          totalPrice + (element.orderQty * double.parse(element.price));
      totalMrpPrice =
          totalMrpPrice + (element.orderQty * double.parse(element.mrpPrice));
    }
  }

  void navigateToPayment() async {
    final isOrderSuccess = await context.router.push(const OrderRoute());
    if (isOrderSuccess != null && (isOrderSuccess as bool)) {
      cartCubit.clearCart();
    }
  }

  void navigateAddAddress() async {
    final result = await context.router.push(AddressRoute(isSelection: false));
    if (!isAddressAvailable) {
      addressCubit.getAddress(false);
    }
  }

  Widget _buildCartItem(CartItem? cartItem, int index, Box<CartItem> box) {
    return Card(
      elevation: 4,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 75,
              width: 75,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: cartItem?.imageUrl ?? "",
                fit: BoxFit.fill,
                errorWidget: (context, url, error) =>
                    SvgPicture.asset("assets/no-image-placeholder.svg"),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cartItem?.name ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12.0),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    cartItem?.quantity ?? "",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF034703),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (cartItem?.orderQty == 1) {
                              cartItem?.delete();
                            } else {
                              cartItem?.orderQty = cartItem.orderQty - 1;
                              cartItem?.save();
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: kIsWeb ? 10 : 12,
                            ),
                          )),
                      Text(cartItem?.orderQty.toString() ?? "1",
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.white)),
                      GestureDetector(
                          onTap: () {
                            cartItem?.orderQty = cartItem.orderQty + 1;
                            cartItem?.save();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: kIsWeb ? 10 : 12,
                            ),
                          ))
                    ],
                  ),
                ),
                const Gap(16.0),
                Column(
                  children: [
                    Text(
                        (double.parse(cartItem?.orderQty.toString() ?? "") *
                                double.parse(cartItem?.price ?? ""))
                            .toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                    Text(
                      (double.parse(cartItem?.orderQty.toString() ?? "") *
                              double.parse(cartItem?.mrpPrice ?? ""))
                          .toString(),
                      style: TextStyle(
                          color: Colors.red.shade200,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                const Gap(16.0)
              ],
            )
          ],
        ),
      ),
    );
  }

  void navigateAddress() async {
    final result = await context.router.push(AddressRoute(isSelection: true));
    if (result != null && result as bool) {
      addressCubit.getDefaultAddress();
    }
  }

  Widget getWebNavigationBar(BuildContext context, Address? address) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          color: const Color(0xFF034703),
          child: Row(
            children: [
              const Gap(32.0),
              GestureDetector(
                  onTap: () {
                    context.tabsRouter.setActiveIndex(0);
                  },
                  child: SvgPicture.asset("assets/ic_dashboard_logo.svg")),
              const Gap(16.0),
              GestureDetector(
                onTap: () {
                  navigateAddress();
                },
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${address?.label} - ${address?.address1}, ${address?.address2}...",
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
              TextButton(
                child: Text(
                  "My Account",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SettingsScreen())); // Assuming you have a SettingsRoute defined
                },
              ),
              const Gap(16.0),
              ValueListenableBuilder(
                valueListenable: Hive.box<CartItem>("cart_items").listenable(),
                builder: (context, box, child) {
                  return box.values.isNotEmpty
                      ? ElevatedButton.icon(
                          onPressed: () {
                            context.tabsRouter.setActiveIndex(4);
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
                            context.tabsRouter.setActiveIndex(4);
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("My Cart"));
                },
              ),
              const Gap(32.0)
            ],
          ),
        )
      ],
    );
  }
}
