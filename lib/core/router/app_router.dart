import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:sel_org/setting_sections/customer_section/customer_support.dart';
import 'package:sel_org/ui/account/pages/settings_page.dart';
import '../../setting_sections/Address_Section/address.dart';
import '../../setting_sections/OrderScreen/ordered.dart';
import '../../setting_sections/Suggest_products/suggest_prod.dart';
import '../../ui/account/model/address_model.dart';
import '../../ui/account/pages/add_address_page.dart';
import '../../ui/account/pages/address_page.dart';
import '../../ui/account/pages/faq_page.dart';
import '../../ui/account/pages/generalinfo_page.dart';
import '../../ui/account/pages/locaion_map_page.dart';
import '../../ui/account/pages/notification_page.dart';
import '../../ui/account/pages/orders_page.dart';
import '../../ui/account/pages/policy_page.dart';
import '../../ui/account/pages/profile_page.dart';
import '../../ui/account/pages/referals_page.dart';
import '../../ui/account/pages/refund_page.dart';
import '../../ui/dashboard/pages/account_page.dart';
import '../../ui/dashboard/pages/cart_page.dart';
import '../../ui/dashboard/pages/category_page.dart';
import '../../ui/dashboard/pages/dashboard_page.dart';
import '../../ui/dashboard/pages/empty_page.dart';
import '../../ui/dashboard/pages/fresh.dart';
import '../../ui/dashboard/pages/home_page.dart';
import '../../ui/dashboard/pages/offer_page.dart';
import '../../ui/login/pages/login_page.dart';
import '../../ui/login/pages/otp_verify_page.dart';
import '../../ui/login/pages/update_name_page.dart';
import '../../ui/order/pages/order_page.dart';
import '../../ui/products/pages/products_page.dart';
import '../../ui/splash/splash_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/otp-verify', page: OtpVerifyRoute.page),
        AutoRoute(path: '/update-name', page: UpdateNameRoute.page),
        AutoRoute(path: '/dashboard', page: DashboardRoute.page, children: [
          RedirectRoute(path: '', redirectTo: "home"),
          AutoRoute(path: 'home', page: HomeRoute.page),
          // AutoRoute(path: 'categories', page: CategoryRoute.page),
          // Nested route within tab navigation
          AutoRoute(path: 'categories', page: EmptyRouter.page, children: [
            AutoRoute(path: '', page: CategoryRoute.page),
            AutoRoute(path: 'products', page: ProductRoute.page),
          ]),
          //new routes

          AutoRoute(path: 'fresh', page: FreshRoute.page),
          AutoRoute(path: 'offers', page: OffersRoute.page),
          AutoRoute(path: 'cart', page: CartRoute.page),
          // AutoRoute(path: 'account', page: AccountRoute.page)
        ]),
        AutoRoute(path: '/settings', page: SettingsRoute.page, children: [
          RedirectRoute(path: '', redirectTo: "home"),
          AutoRoute(path: 'ordered', page: OrderedScreenRoute.page),
          AutoRoute(path: 'Referral', page: ReferralsRoute.page),
          AutoRoute(path: 'Referral', page: CustomerSupportFaqRoute.page),
          AutoRoute(path: 'Referral', page: AddressesRoute.page),
          AutoRoute(path: 'Referral', page: RefundsRoute.page),
          AutoRoute(path: 'profile', page: ProfileRoute.page),
          AutoRoute(path: 'Referral', page: SuggestsRoute.page),
          AutoRoute(path: 'Referral', page: GeneralRoute.page),
          AutoRoute(path: 'Referral', page: NotificationRoute.page),
        ]),
        AutoRoute(path: '/referrals', page: ReferralsRoute.page),
        AutoRoute(path: '/products', page: ProductRoute.page),
        AutoRoute(path: '/profile', page: ProfileRoute.page),
        AutoRoute(path: '/order-history', page: OrdersRoute.page),
        AutoRoute(path: '/addresses', page: AddressRoute.page),
        AutoRoute(path: '/add-address', page: AddAddressRoute.page),
        AutoRoute(path: '/location-info', page: LocationMapRoute.page),
        AutoRoute(path: '/refunds', page: RefundRoute.page),
        AutoRoute(path: '/policy', page: PolicyRoute.page),
        AutoRoute(path: '/faq', page: FaqRoute.page),
        AutoRoute(path: '/order', page: OrderRoute.page),
      ];
}
