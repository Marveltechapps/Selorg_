import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/ui/account/pages/profile_page.dart';
import 'package:sel_org/ui/account/pages/referals_page.dart';
import '../../../setting_sections/Address_Section/address.dart';
import '../../../setting_sections/Common widgets/title_bar.dart';
import '../../../setting_sections/OrderScreen/ordered.dart';
import '../../../setting_sections/Refunds/refund.dart';
import '../../../setting_sections/Suggest_products/suggest_prod.dart';
import '../../../setting_sections/customer_section/customer_support.dart';
import '../../widgets/settcustom_card.dart';
import '../bloc/cubit/settings_cubit.dart';
import '../model/settings_list_items.dart';
import 'package:auto_route/annotations.dart';
import 'generalinfo_page.dart';
import 'notification_page.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleBar(text: "Setting"),
                const SizedBox(height: 20),
                const SettingsCustomCard(),
                const SizedBox(height: 20),
                BlocBuilder<AppCubit, int>(
                  builder: (context, screenIndex) {
                    final List<dynamic> screens = [
                      const OrderedScreen(),
                      const Referals(),
                      const CustomerSupport(),
                      const AddressSetScreen(),
                      const RefundScreen(),
                      const ProfileScreen(),
                      const Suggestions(),
                      const GeneralPolicyScreen(),
                      const NotificationScreen(),

                      // const OrderedScreenRoute(),
                      // ReferralsRoute(),
                      // const CustomerSupportFaqRoute(),
                      // const AddressesRoute(),
                      // const RefundsRoute(),
                      // const ProfileRoute(),
                      // const SuggestsRoute(),
                      // const GeneralRoute(),
                      // const NotificationRoute(),
                    ];
                    return Container(
                      height: 600,
                      child: ListView.separated(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(items[index].iconData),
                            title: Text(items[index].text),
                            onTap: () {
                              // if (screens[index] == 6) {
                              //   showModalBottomSheet(
                              //       context: context,
                              //       builder: (context) => const Suggestions());
                              // } else {
                              // context.router.push(SettingsRoute());
                              // context.router.push(screens[index]);
                              // context.router
                              //     .push(screens[index] as PageRouteInfo);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return screens[index];
                              }));
                            },
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                // if (screens[index] == 6) {
                                //   showModalBottomSheet(
                                //       context: context,
                                //       builder: (context) =>
                                //           const Suggestions());
                                // } else {
                                //   // context.router.push(SettingsRoute());
                                //
                                //   // context.router
                                //   //     .push(screens[index] as PageRouteInfo);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return screens[index];
                                }));
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text('Log Out'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
