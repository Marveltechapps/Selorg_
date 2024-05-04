import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sel_org/core/utils/dialog_utils.dart';
import 'package:sel_org/ui/account/pages/settings_page.dart';
import '../../../core/di/injector.dart';
import '../../../core/router/app_router.dart';
import '../../../networking/models/account/address_response.dart';
import '../../account/bloc/cubit/address_cubit.dart';
import '../../account/bloc/state/address_state.dart';
import '../bloc/cubit/account_cubit.dart';
import '../bloc/cubit/category_cubit.dart';
import '../bloc/state/category_state.dart';
import '../models/cart_item.dart';
import 'footer.dart';

@RoutePage()
class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) {
        return getIt<CategoryCubit>();
      }),
      BlocProvider(create: (BuildContext context) {
        return getIt<AddressCubit>();
      }),
      BlocProvider(create: (BuildContext context) {
        return getIt<AccountCubit>();
      })
    ], child: const OfferScreenContent());
  }
}

class OfferScreenContent extends StatefulWidget {
  const OfferScreenContent({super.key});

  @override
  State<OfferScreenContent> createState() => _OfferScreenContentState();
}

class _OfferScreenContentState extends State<OfferScreenContent>
    with WidgetsBindingObserver {
  final List<String> cards = [
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/In-House/Banner_4.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/In-House/Banner_3.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_3.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_4.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/In-House/Banner_5.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/In-House/Banner_6.png"
  ];
  late CategoryCubit categoryCubit;
  late AddressCubit addressCubit;
  late AccountCubit accountCubit;
  bool isAddressAvailable = false;
  int count = 0;
  late double screenSize;

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
    final double screenWidth = MediaQuery.of(context).size.width;
    EdgeInsets padding = screenWidth < 600
        ? const EdgeInsets.symmetric(
            horizontal: 20) // Less padding for smaller screens
        : const EdgeInsets.symmetric(
            horizontal: 70); // More padding for larger screens

    return Column(
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
                      title: const Text("Offers"),
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
        //if (screenSize >= 640)
        Expanded(
          child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.greenAccent),
              );
            } else if (state is CategoryLoaded) {
              //final response = state.categoryResponse.data;

              return ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (screenSize >= 640)
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/bg_delivery_bar.png"),
                                fit: BoxFit.cover),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/ic_delivery_man.png")),
                              Gap(16.0),
                              Flexible(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "Delivery in ONLY 10 minutes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff9F581F),
                                        fontSize: 16.0)),
                              ),
                              Gap(16.0),
                              Image(
                                  image:
                                      AssetImage("assets/ic_delivery_hand.png"))
                            ],
                          ),
                        ),
                      SingleChildScrollView(
                        // Add this to make the column scrollable
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(20),
                            Padding(
                              padding: padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List<Widget>.generate(cards.length,
                                    (index) {
                                  return AspectRatio(
                                    aspectRatio: 16 /
                                        9, // Maintain the aspect ratio for cards
                                    child: GestureDetector(
                                      onTap: () {
                                        // navigateToProduct(context,
                                        //     "Fruits & Vegetables", "FV1");
                                      },
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: CachedNetworkImage(
                                          imageUrl: cards[index],
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                                  child: Icon(Icons.error)),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const Gap(20),
                            Padding(
                              padding: padding,
                              child: GestureDetector(
                                  onTap: () {
                                    // navigateToProduct(
                                    //     context, "Fruits & Vegetables", "FV1");
                                  },
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    imageUrl:
                                        "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_9.png",
                                    errorWidget: (context, url, error) =>
                                        SvgPicture.asset(
                                            "assets/no-image-placeholder.svg"),
                                  )),
                            ),
                            const Gap(20),
                            Padding(
                              padding: padding,
                              child: GestureDetector(
                                  onTap: () {
                                    // navigateToProduct(
                                    //     context, "Fruits & Vegetables", "FV1");
                                  },
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    imageUrl:
                                        "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_11.png",
                                    errorWidget: (context, url, error) =>
                                        SvgPicture.asset(
                                            "assets/no-image-placeholder.svg"),
                                  )),
                            ),
                            const Gap(20),
                            Padding(
                              padding: padding,
                              child: Text(
                                "Celebrate Diwali With These",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width > 600
                                            ? 40
                                            : 15,
                                    color: Colors.black),
                              ),
                            ),
                            const Gap(16),
                            Padding(
                              padding: padding,
                              child: Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      // navigateToProduct(context,
                                      //     "Fruits & Vegetables", "FV1");
                                    },
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      imageUrl:
                                          "https://selorg.s3.ap-south-1.amazonaws.com/Banner/In-House/Large_Banner_3.png",
                                      errorWidget: (context, url, error) =>
                                          SvgPicture.asset(
                                              "assets/no-image-placeholder.svg"),
                                    )),
                              ),
                            ),
                            const Gap(32),
                            const Footer()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
        ),
        // const Gap(16),
      ],
    );
  }

  void navigateToProduct(
      BuildContext context, String name, String categoryCode) {
    context.router.push(ProductRoute(
      categoryName: name,
      categoryCode: categoryCode,
    ));
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
            ],
          ),
        )
      ],
    );
  }

  void navigateAddAddress() async {
    //final result = await context.router.push(AddressRoute(isSelection: false));
    if (!isAddressAvailable) {
      addressCubit.getAddress(false);
    }
  }

  void navigateAddress() async {
    final result = await context.router.push(AddressRoute(isSelection: true));
    if (result != null && result as bool) {
      addressCubit.getDefaultAddress();
    }
  }
}
