import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/ui/splash/bloc/splash_cubit.dart';
import 'package:sel_org/ui/splash/bloc/splash_state.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<SplashCubit>(), child: const SplashBody());
  }
}

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black.withOpacity(0.002),
      ),
    );
    context.read<SplashCubit>().checkLoggedState();
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is ShowLogin) {
          context.router.replace(const LoginRoute());
        } else if (state is ShowDashboard) {
          context.router.replace(const HomeRoute());
        } else if (state is ShowUpdateName) {
          context.router.replace(const UpdateNameRoute());
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF034703), Color(0xFF00A85A)])),
        child: Center(child: Image.asset('assets/logo_selorg.png')),
      ),
    );
  }
}
