import 'package:flutter/material.dart';

import 'all_tab.dart';

class WalletActivity extends StatefulWidget {
  const WalletActivity({super.key});

  @override
  State<WalletActivity> createState() => _WalletActivityState();
}

class _WalletActivityState extends State<WalletActivity>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // HEADER --------------------------------------------------------

          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
            alignment: mobile ? Alignment.center : Alignment.centerLeft,
            decoration: BoxDecoration(
              border: const Border(
                  bottom: BorderSide(width: 1, color: Colors.black)),
              color: mobile ? Colors.white : Colors.grey.shade300,
            ),
            child: Text(
              "Activity",
              style: TextStyle(
                  fontSize: mobile ? 25 : 35, fontWeight: FontWeight.bold),
            ),
          ),
          // const Divider(
          //   thickness: 1.5,
          // ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0),
            width: mobile ? width * 0.90 : width * 0.70,
            height: mobile ? 40 : 60,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              automaticIndicatorColorAdjustment: false,
              indicator: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(
                  fontSize: mobile ? 16 : 25, fontWeight: FontWeight.w500),
              tabAlignment: TabAlignment.fill,
              splashBorderRadius: BorderRadius.circular(30),
              tabs: const [
                Tab(
                  text: "All",
                  iconMargin: EdgeInsets.only(left: 5),
                ),
                Tab(
                  text: "Debits",
                ),
                Tab(
                  text: "Credits",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              const AllTabScreen(),
              // Container(
              //   color: Colors.orange,
              // ),
              AllTabScreen(),
              AllTabScreen(),
            ]),
          ),

          // FOOTER --------------------------------------------------------
        ],
      ),
    );
  }
}
