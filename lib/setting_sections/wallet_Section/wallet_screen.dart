import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sel_org/setting_sections/Common%20widgets/title_bar.dart';
import 'package:sel_org/setting_sections/wallet_Section/walletactivity.dart';

import '../../ui/dashboard/pages/cart_page.dart';
import 'free_delivery.dart';
import 'howitswork_pg.dart';

@RoutePage()
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      height: 100,
                      decoration: mobile
                          ? const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF034703),
                                  Color.fromRGBO(
                                      3, 71, 3, 0.5), // rgba(3, 71, 3, 0.5)
                                  // #034703
                                ],
                              ),
                            )
                          : const BoxDecoration(
                              color: Color(0xFFD8DCC4),
                            ),
                      child: TitleBar(text: "Wallet"),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -100,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: mobile ? 8 : 16,
                          right: mobile ? 8 : 16,
                          top: 16,
                          bottom: 8),
                      width: mobile ? width * 0.80 : width * 0.60,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left side: Icon with Text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const IconWithText(
                                      icon: Icons.currency_rupee, text: "0"),
                                  Row(
                                    children: [
                                      Text(
                                        "Your balance",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: mobile ? 14 : 18,
                                            color: Colors.green),
                                      ),
                                      const Icon(
                                        Icons.info_outlined,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Right side: Two Icons
                              SizedBox(
                                  width: mobile ? width * 0.08 : width * 0.04,
                                  height: mobile ? 40 : 50,
                                  child: Image.asset(
                                    'assets/wallet_icon.png',
                                    fit: BoxFit.fill,
                                  ))
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left side: Icon with Text
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_outline,
                                    color: Colors.green,
                                    size: mobile ? 20 : 25,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Redeem Voucher",
                                    style: TextStyle(
                                        fontSize: mobile ? 14 : 16,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: mobile ? 20 : 25,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mobile ? 16 : 128, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add money to Selorg Cash',
                      style: TextStyle(
                          fontSize: mobile ? 16 : 22,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const HowItWorks(),
                          shape: const BeveledRectangleBorder(),
                        );
                      },
                      child: Text('How it works',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: mobile ? 14 : 16,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.only(
                    left: mobile ? 8 : 24,
                    right: mobile ? 8 : 24,
                    top: mobile ? 8 : 24,
                    bottom: mobile ? 8 : 24),
                width: mobile ? width * 0.80 : width * 0.60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "1000",
                        style: TextStyle(fontSize: mobile ? 16 : 18),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mobile ? 0 : 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          amtContainer("₹250", context),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          amtContainer("₹250", context),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          amtContainer("₹250", context),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          amtContainer("₹250", context),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mobile ? 0 : 32),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color(0xFF034703),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "Top Up",
                              style: TextStyle(
                                  fontSize: mobile ? 16 : 18,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mobile ? 16 : 128,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Activity',
                      style: TextStyle(
                          fontSize: mobile ? 16 : 22,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const WalletActivity()));
                      },
                      child: Text('See All >',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: mobile ? 14 : 16,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mobile ? 16 : 128,
              ),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: mobile ? 20 : 30,
                          height: mobile ? 20 : 40,
                          child: Image.asset("assets/Gift.png"),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Selorg Cash - Valid for next order ',
                              style: TextStyle(
                                  fontSize: mobile ? 14 : 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '26/01/24 at 01:52 am',
                              style: TextStyle(
                                fontSize: mobile ? 12 : 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('+₹50',
                            style: TextStyle(
                                fontSize: mobile ? 18 : 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.green)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Expires 24/1/25',
                          style: TextStyle(
                            fontSize: mobile ? 12 : 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              width: width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const FreeDelivery(),
                        shape: const BeveledRectangleBorder(),
                      );
                    },
                    child: Card(
                      child: Container(
                        height: 70,
                        width: mobile ? width : width * 0.70,
                        child: ListTile(
                          isThreeLine: true,
                          leading: SizedBox(
                            width: mobile ? 25 : 40,
                            height: mobile ? 30 : 50,
                            child: Image.asset("assets/openlock_icon.png"),
                          ),
                          title: const Text(
                            'Yay! You’ve unlocked',
                          ),
                          subtitle: const Text(
                            'Free Delivery',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ), // Center text
                          trailing: Column(
                            children: [
                              Row(
                                // Rupee icon with text on the right
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: mobile ? 3 : 3,
                                          horizontal: mobile ? 8 : 12),
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF034703),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Text('1/3',
                                          style: TextStyle(
                                              fontSize: mobile ? 16 : 18,
                                              color: Colors.white))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: mobile ? 8 : 0),
                      padding: EdgeInsets.symmetric(
                          vertical: 8, horizontal: mobile ? 8 : 16),
                      height: mobile ? 50 : 60,
                      width: mobile ? width : width * 0.70,
                      decoration: const BoxDecoration(
                          color: Color(0xFF034703),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1 Item | ₹92',
                              style: TextStyle(
                                  fontSize: mobile ? 16 : 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CartScreen()));
                                // context.tabsRouter.setActiveIndex(3);
                              },
                              child: Text("View Cart",
                                  style: TextStyle(
                                      fontSize: mobile ? 16 : 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget amtContainer(String text, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Expanded(
      child: Container(
        //  padding:const EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(
          text,
          style: TextStyle(fontSize: mobile ? 16 : 18),
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.green,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: MediaQuery.of(context).size.width > 600 ? 40 : 30,
              color: Colors.black),
        ),
      ],
    );
  }
}
