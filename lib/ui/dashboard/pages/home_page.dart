import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/core/utils/dialog_utils.dart';
import 'package:sel_org/core/utils/dimens.dart';
import 'package:sel_org/core/utils/string_utils.dart';
import 'package:sel_org/networking/models/account/address_response.dart';
import 'package:sel_org/ui/account/bloc/cubit/address_cubit.dart';
import 'package:sel_org/ui/account/bloc/state/address_state.dart';
import 'package:sel_org/ui/dashboard/pages/search_page.dart';
import '../../../networking/models/products/category_response.dart';
import '../../../setting_sections/wallet_Section/wallet_screen.dart';
import '../bloc/cubit/account_cubit.dart';
import '../bloc/cubit/category_cubit.dart';
import '../bloc/cubit/search_cubit.dart';
import '../bloc/state/category_state.dart';
import '../bloc/state/search_state.dart';
import '../models/cart_item.dart';
import 'categories_item.dart';
import 'const.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      }),
    ], child: const HomeScreenContent());
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenContent();
}

class _HomeScreenContent extends State<HomeScreenContent>
    with WidgetsBindingObserver {
  late CategoryCubit categoryCubit;
  late AddressCubit addressCubit;
  late AccountCubit accountCubit;
  bool isAddressAvailable = false;
  int count = 0;
  late double screenSize;
  List<String> cards = [
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_1.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_2.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_3.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_4.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_5.png"
  ];
  List<String> cards2 = [
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_7.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_8.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_10.png",
    "https://selorg.s3.ap-south-1.amazonaws.com/Banner/banner_6.png"
  ];

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
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: const Color(0xFF034703),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          navigateAddress();
                                        },
                                        child: Text(
                                          "${address?.label} - ${address?.address1}, ${address?.address2}...",
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(Icons.keyboard_arrow_down,
                                          color: Colors.white),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Wallet()));
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/Wallet.svg',
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            context.router
                                                .push(SettingsRoute());
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/profile.svg',
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      // Expanded(
                                      //   child: TextField(
                                      //     style: const TextStyle(
                                      //         color: Color(
                                      //             0xFF034703)), // Text color inside the search bar
                                      //     decoration: InputDecoration(
                                      //       isDense:
                                      //           true, // Reduces the overall size of the TextField
                                      //       contentPadding: const EdgeInsets
                                      //           .symmetric(
                                      //           vertical: 10.0,
                                      //           horizontal:
                                      //               10.0), // Adjusts padding inside the search bar
                                      //       hintText:
                                      //           "Search For Products", // Placeholder text
                                      //       hintStyle: const TextStyle(
                                      //           color: Color(
                                      //               0xFF034703)), // Placeholder text style
                                      //       prefixIcon: const Icon(Icons.search,
                                      //           color: Color(0xFF034703),
                                      //           size: 20), // Smaller icon size
                                      //       filled: true,
                                      //       fillColor: Colors
                                      //           .white, // Background color of the search bar
                                      //       border: OutlineInputBorder(
                                      //         borderSide: BorderSide
                                      //             .none, // No visible border
                                      //         borderRadius: BorderRadius.circular(
                                      //             15), // Subtly rounded corners for a rectangular look
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            } else {
              return Container();
            }
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
        Expanded(
          child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.greenAccent),
              );
            } else if (state is CategoryLoaded) {
              final response = state.categoryResponse.data;
              return ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                image: AssetImage(
                              "assets/ic_delivery_man.png",
                            )),
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
                      Container(
                        padding: EdgeInsets.only(
                            left: context.getPadding(),
                            right: context.getPadding()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Gap(16.0),
                            GestureDetector(
                                onTap: () {
                                  navigateToProduct(
                                      context, "Fruits & Vegetables", "FV1");
                                },
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  imageUrl:
                                      "https://selorg.s3.ap-south-1.amazonaws.com/Banner/In-House/Main+banner/New_Year_Banner.png",
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(
                                          "assets/no-image-placeholder.svg"),
                                )),
                            const Gap(32.0),

                            AutoSizeText(
                              "Products For You",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black),
                            ),

                            const Gap(32.0),
                            singleproduct(),
                            const Gap(32.0),
                            SizedBox(
                              height:
                                  screenSize >= 640 && kIsWeb ? 250.0 : 200.0,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const Gap(16.0);
                                },
                                itemCount: cards.length,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      navigateToProduct(context,
                                          "Fruits & Vegetables", "FV1");
                                    },
                                    child: Card(
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                                "assets/no-image-placeholder.svg"),
                                        imageUrl: cards[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Gap(32.0),
                            Text(
                              "Explore By Categories",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black),
                            ),
                            const Gap(32.0),
                            CategoryContent(),
                            const Gap(32.0),
                            GestureDetector(
                                onTap: () {
                                  navigateToProduct(
                                      context, "Fruits & Vegetables", "FV1");
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
                            const Gap(32.0),
                            // const Text(
                            //   "Explore by categories",
                            //   textAlign: TextAlign.start,
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 18.0,
                            //       color: Colors.black),
                            // ),
                            // const Gap(16.0),
                            // AlignedGridView.count(
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     shrinkWrap: true,
                            //     mainAxisSpacing: 10,
                            //     crossAxisSpacing: 10,
                            //     crossAxisCount: screenSize < 640 ? 2 : 3,
                            //     itemCount: response.length,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return _buildCategoryItem(
                            //           context, response, index);
                            //     }),
                            // /*GridView.builder(
                            //     itemCount: response.length,
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     shrinkWrap: true,
                            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //       crossAxisCount: context.getGridColumn(),
                            //       crossAxisSpacing: 8,
                            //       mainAxisSpacing: 8,
                            //     ),
                            //     itemBuilder: (context, index) {
                            //       return _buildCategoryItem(context, response, index);
                            //     }),*/
                            // const Gap(32.0),
                            SizedBox(
                              height:
                                  screenSize >= 640 && kIsWeb ? 250.0 : 200.0,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const Gap(16.0);
                                },
                                itemCount: cards2.length,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      navigateToProduct(context,
                                          "Fruits & Vegetables", "FV1");
                                    },
                                    child: Card(
                                      child: CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                                "assets/no-image-placeholder.svg"),
                                        imageUrl: cards2[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Gap(32.0),
                            GestureDetector(
                                onTap: () {
                                  navigateToProduct(
                                      context, "Fruits & Vegetables", "FV1");
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
                          ],
                        ),
                      ),
                      const Gap(16.0),
                      Center(
                        child: SizedBox(
                          width:
                              300, // Define an appropriate width based on your design requirements
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Minimizes the size of the column to fit the children
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Can’t Find What You Were Looking For?",
                                textAlign: TextAlign
                                    .center, // Changed from justify to center for better visual effect
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        24.0, // Adjusted for better readability
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                  height:
                                      20), // Adds spacing between the text and the text field
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Suggest a Product",
                                  filled: true,
                                  fillColor: Colors
                                      .white, // Un-commented and used white to show the fill effect
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(64.0),
                      screenSize >= 640 && kIsWeb
                          ? Container(
                              padding: const EdgeInsets.only(left: 32.0),
                              color: const Color(0xFF034703),
                              height: 200.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Gap(16.0),
                                      Image.asset('assets/logo_selorg.png'),
                                      const Gap(16.0),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "assets/ic_instagram.png"),
                                          const Gap(16.0),
                                          Image.asset("assets/ic_twitter.png"),
                                          const Gap(16.0),
                                          Image.asset("assets/ic_facebook.png"),
                                        ],
                                      )
                                    ],
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          child: const Text("Privacy policies",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onTap: () {
                                            context.router
                                                .push(const FaqRoute());
                                          },
                                        ),
                                        const Gap(16.0),
                                        GestureDetector(
                                          child: const Text(
                                              "Terms and conditions",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onTap: () {
                                            context.router
                                                .push(const FaqRoute());
                                          },
                                        ),
                                        const Gap(16.0),
                                        GestureDetector(
                                          child: const Text(
                                              "Return and refund policy",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onTap: () {
                                            context.router
                                                .push(const FaqRoute());
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          child: const Text(
                                              "Shipping and delivery",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onTap: () {
                                            context.router
                                                .push(const FaqRoute());
                                          },
                                        ),
                                        const Gap(16.0),
                                        GestureDetector(
                                          child: const Text(
                                              "Customer support & FAQ",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onTap: () {
                                            context.router
                                                .push(const FaqRoute());
                                          },
                                        ),
                                        const Gap(16.0),
                                        GestureDetector(
                                          child: const Text("Delivery areas",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onTap: () {
                                            context.router
                                                .push(const FaqRoute());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Download App",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        const Gap(16.0),
                                        OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                  width: 1.0,
                                                  color: Colors.white),
                                            ),
                                            onPressed: null,
                                            icon: Image.asset(
                                                "assets/ic_play_store.png"),
                                            label: const Text(
                                              "Get it on Play Store",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        const Gap(8.0),
                                        OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                  width: 1.0,
                                                  color: Colors.white),
                                            ),
                                            onPressed: null,
                                            icon: Image.asset(
                                                "assets/ic_app_store.png"),
                                            label: const Text(
                                                "Get it on App Store",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, List<CategoryItem> listCategory, int index) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(listCategory[index].category_desc.capitalize(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              const Gap(16.0),
              CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: listCategory[index].image,
                errorWidget: (context, url, error) =>
                    SvgPicture.asset("assets/no-image-placeholder.svg"),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        navigateToProduct(context, listCategory[index].category_desc,
            listCategory[index].category_code);
      },
    );
  }

  void navigateToProduct(
      BuildContext context, String name, String categoryCode) {
    context.router
        .push(ProductRoute(categoryName: name, categoryCode: categoryCode));
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
              // Expanded(
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: "Search For Products",
              //       prefixIcon: const Icon(Icons.search),
              //       filled: true,
              //       //fillColor: Colors.white,
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //         borderRadius: BorderRadius.circular(30.0),
              //       ),
              //       // enabledBorder: OutlineInputBorder(
              //       //   borderSide: BorderSide(color: Colors.white, width: 0),
              //       //   borderRadius: BorderRadius.circular(30.0),
              //       // ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide:
              //             const BorderSide(color: Colors.green, width: 1.5),
              //         borderRadius: BorderRadius.circular(30.0),
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    // Pass the search term to the search bloc
                    context
                        .read<SearchBloc>()
                        .add(SearchTextChanged(searchText: value));
                  },
                  decoration: InputDecoration(
                    hintText: "Search For Products",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
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
                  context.router.push(SettingsRoute());
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
