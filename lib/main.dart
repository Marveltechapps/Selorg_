import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/core/theme/app_theme.dart';
import 'package:sel_org/networking/models/account/address_response.dart';
import 'package:sel_org/ui/dashboard/models/cart_item.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();

  configureDependencies(environment: prod);
  runApp(MyApp());
}

void initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<CartItem>(CartItemAdapter());
  Hive.registerAdapter<Address>(AddressAdapter());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
      return MaterialApp.router(
        routerConfig: appRouter.config(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: "SelOrg",
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme(lightColorScheme),
        darkTheme: AppTheme.darkTheme(darkColorScheme),
      );
    });
  }
}
