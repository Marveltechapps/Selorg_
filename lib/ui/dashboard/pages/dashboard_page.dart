import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import '../../../core/utils/dimens.dart';
import '../bloc/cubit/dashboard_cubit.dart';
import '../bloc/state/dashboard_state.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) {
        return getIt<DashboardCubit>();
      })
    ], child: const DashboardScreenContent());
  }
}

class DashboardScreenContent extends StatefulWidget {
  const DashboardScreenContent({super.key});

  @override
  State<StatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreenContent> {
  int count = 0;
  late double screenSize;
  late DashboardCubit dashboardCubit;

  @override
  void initState() {
    super.initState();
    dashboardCubit = context.read<DashboardCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
  }

  @override
  void dispose() {
    super.dispose();
    dashboardCubit.dismissCartListener();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    dashboardCubit.listenForCartCount();
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        CategoryRoute(),
        FreshRoute(),
        OffersRoute(),
        CartRoute(),
        // AccountRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return WillPopScope(
          onWillPop: () {
            if (context.tabsRouter.activeIndex != 0) {
              context.tabsRouter.setActiveIndex(0);
              return Future(() => false);
            } else if (context.tabsRouter.activeIndex == 0 &&
                context.tabsRouter.canNavigateBack) {
              context.router.pop();
              return Future(() => false);
            } else {
              return Future(() => true);
            }
          },
          child: Scaffold(
              //appBar: AppBar(),
              body: SafeArea(
                child: BlocListener<DashboardCubit, DashboardState>(
                  listener: (context, state) {
                    if (state is CartCount) {
                      var liveCount = state.count;
                      setState(() {
                        count = liveCount;
                      });
                    }
                  },
                  child: kIsWeb && screenSize >= 640
                      ? Column(
                          children: [Expanded(child: child)],
                        )
                      : Row(
                          children: [
                            screenSize >= 640
                                ? NavigationRail(
                                    extended: true,
                                    backgroundColor: Colors.green.shade200,
                                    elevation: 12.0,
                                    indicatorColor: Colors.white,
                                    selectedIndex: tabsRouter.activeIndex,
                                    onDestinationSelected: (index) {
                                      tabsRouter.setActiveIndex(index);
                                    },
                                    destinations: [
                                      const NavigationRailDestination(
                                          label: Text('Home'),
                                          icon: Icon(Icons.category)),
                                      NavigationRailDestination(
                                        label: const Text("Cart"),
                                        icon: count > 0
                                            ? Badge(
                                                label: Text(count.toString()),
                                                child: const Icon(
                                                    Icons.shopping_cart))
                                            : const Icon(Icons.shopping_cart),
                                      ),
                                      const NavigationRailDestination(
                                          label: Text('Account'),
                                          icon: Icon(Icons.manage_accounts)),
                                    ],
                                  )
                                : Container(),
                            Expanded(child: child)
                          ],
                        ),
                ),
              ),
              bottomNavigationBar: screenSize < 640
                  ? NavigationBar(
                      //backgroundColor: Colors.green.shade200,
                      elevation: 12.0,
                      indicatorColor: Colors.white,
                      selectedIndex: tabsRouter.activeIndex,
                      onDestinationSelected: (index) {
                        tabsRouter.setActiveIndex(index);
                      },
                      destinations: [
                        NavigationDestination(
                            label: 'Home',
                            icon: SvgPicture.asset(
                              'assets/home.svg',
                            )), // Using SVG icon),
                        NavigationDestination(
                            label: 'Categories',
                            icon: SvgPicture.asset(
                              'assets/categories.svg',
                            )),
                        NavigationDestination(
                            label: 'fresh',
                            icon: SvgPicture.asset(
                              'assets/fresh.svg',
                            )),
                        NavigationDestination(
                            label: 'offers',
                            icon: SvgPicture.asset(
                              'assets/offer.svg',
                            )),
                        NavigationDestination(
                            label: 'Cart',
                            icon: count > 0
                                ? Badge(
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    label: Text(count.toString()),
                                    child: SvgPicture.asset('assets/cart.svg'))
                                : SvgPicture.asset(
                                    'assets/cart.svg')) // Using SVG icon),
                      ],
                    )
                  : null),
        );
      },
    );
  }
}
