// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    AddAddressRoute.name: (routeData) {
      final args = routeData.argsAs<AddAddressRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddAddressScreen(args.addressModel),
      );
    },
    AddressRoute.name: (routeData) {
      final args = routeData.argsAs<AddressRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddressScreen(
          args.isSelection,
          key: args.key,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    OrderedScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderedScreen(),
      );
    },
    ReferralsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Referals(),
      );
    },
    CustomerSupportFaqRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerSupport(),
      );
    },
    AddressesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddressSetScreen(),
      );
    },
    SuggestsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Suggestions(),
      );
    },
    GeneralRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GeneralPolicyScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    FreshRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Festival(),
      );
    },
    OffersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OfferScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    EmptyRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmptyPageScreen(),
      );
    },
    FaqRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FaqScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LocationMapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationMapScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    OrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderScreen(),
      );
    },
    OtpVerifyRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerifyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpVerifyScreen(mobileNumber: args.mobileNumber),
      );
    },
    PolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PolicyScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductScreen(
          args.categoryName,
          args.categoryCode,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RefundRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RefundScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    UpdateNameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateNameScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddAddressScreen]
class AddAddressRoute extends PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    required AddressModel addressModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddAddressRoute.name,
          args: AddAddressRouteArgs(addressModel: addressModel),
          initialChildren: children,
        );

  static const String name = 'AddAddressRoute';

  static const PageInfo<AddAddressRouteArgs> page =
      PageInfo<AddAddressRouteArgs>(name);
}

class AddAddressRouteArgs {
  const AddAddressRouteArgs({required this.addressModel});

  final AddressModel addressModel;

  @override
  String toString() {
    return 'AddAddressRouteArgs{addressModel: $addressModel}';
  }
}

/// generated route for
/// [AddressScreen]
class AddressRoute extends PageRouteInfo<AddressRouteArgs> {
  AddressRoute({
    required bool isSelection,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddressRoute.name,
          args: AddressRouteArgs(
            isSelection: isSelection,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressRoute';

  static const PageInfo<AddressRouteArgs> page =
      PageInfo<AddressRouteArgs>(name);
}

class AddressRouteArgs {
  const AddressRouteArgs({
    required this.isSelection,
    this.key,
  });

  final bool isSelection;

  final Key? key;

  @override
  String toString() {
    return 'AddressRouteArgs{isSelection: $isSelection, key: $key}';
  }
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryScreen]
/// Home Screen if tappable at mobile dashboard
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class FreshRoute extends PageRouteInfo<void> {
  const FreshRoute({List<PageRouteInfo>? children})
      : super(
          FreshRoute.name,
          initialChildren: children,
        );

  static const String name = 'fresh';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class OrderedScreenRoute extends PageRouteInfo<void> {
  const OrderedScreenRoute({List<PageRouteInfo>? children})
      : super(
          OrderedScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ordered';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class ReferralsRoute extends PageRouteInfo<void> {
  const ReferralsRoute({List<PageRouteInfo>? children})
      : super(
          ReferralsRoute.name,
          initialChildren: children,
        );

  static const String name = 'Referral';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class CustomerSupportFaqRoute extends PageRouteInfo<void> {
  const CustomerSupportFaqRoute({List<PageRouteInfo>? children})
      : super(
          CustomerSupportFaqRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerSupport';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class AddressesRoute extends PageRouteInfo<void> {
  const AddressesRoute({List<PageRouteInfo>? children})
      : super(
          AddressesRoute.name,
          initialChildren: children,
        );

  static const String name = 'Address';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class RefundsRoute extends PageRouteInfo<void> {
  const RefundsRoute({List<PageRouteInfo>? children})
      : super(
          RefundsRoute.name,
          initialChildren: children,
        );

  static const String name = 'Refund';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class OffersRoute extends PageRouteInfo<void> {
  const OffersRoute({List<PageRouteInfo>? children})
      : super(
          OffersRoute.name,
          initialChildren: children,
        );

  static const String name = 'offer';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyPageScreen]
class EmptyRouter extends PageRouteInfo<void> {
  const EmptyRouter({List<PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FaqScreen]
class FaqRoute extends PageRouteInfo<void> {
  const FaqRoute({List<PageRouteInfo>? children})
      : super(
          FaqRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationMapScreen]
class LocationMapRoute extends PageRouteInfo<void> {
  const LocationMapRoute({List<PageRouteInfo>? children})
      : super(
          LocationMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationMapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderScreen]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route forz
/// [OtpVerifyScreen]
class OtpVerifyRoute extends PageRouteInfo<OtpVerifyRouteArgs> {
  OtpVerifyRoute({
    required String mobileNumber,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerifyRoute.name,
          args: OtpVerifyRouteArgs(mobileNumber: mobileNumber),
          initialChildren: children,
        );

  static const String name = 'OtpVerifyRoute';

  static const PageInfo<OtpVerifyRouteArgs> page =
      PageInfo<OtpVerifyRouteArgs>(name);
}

class OtpVerifyRouteArgs {
  const OtpVerifyRouteArgs({required this.mobileNumber});

  final String mobileNumber;

  @override
  String toString() {
    return 'OtpVerifyRouteArgs{mobileNumber: $mobileNumber}';
  }
}

/// generated route for
/// [PolicyScreen]
class PolicyRoute extends PageRouteInfo<void> {
  const PolicyRoute({List<PageRouteInfo>? children})
      : super(
          PolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductScreen]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    required String categoryName,
    required String categoryCode,
    List<PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            categoryName: categoryName,
            categoryCode: categoryCode,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const PageInfo<ProductRouteArgs> page =
      PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    required this.categoryName,
    required this.categoryCode,
  });

  final String categoryName;

  final String categoryCode;

  @override
  String toString() {
    return 'ProductRouteArgs{categoryName: $categoryName, categoryCode: $categoryCode}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RefundScreen]
class RefundRoute extends PageRouteInfo<void> {
  const RefundRoute({List<PageRouteInfo>? children})
      : super(
          RefundRoute.name,
          initialChildren: children,
        );

  static const String name = 'Refund';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class SuggestsRoute extends PageRouteInfo<void> {
  const SuggestsRoute({List<PageRouteInfo>? children})
      : super(
          SuggestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'Suggestion';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class GeneralRoute extends PageRouteInfo<void> {
  const GeneralRoute({List<PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralInfo';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'Notification';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateNameScreen]
class UpdateNameRoute extends PageRouteInfo<void> {
  const UpdateNameRoute({List<PageRouteInfo>? children})
      : super(
          UpdateNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateNameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
