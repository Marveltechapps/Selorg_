import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';
import '../../../core/router/app_router.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize =
        MediaQuery.of(context).size.width; // Get screen width from MediaQuery
    final kIsWeb = MediaQuery.of(context).platformBrightness !=
        null; // Example platform check (customize as needed)

    return screenSize >= 640 && kIsWeb
        ? Container(
            padding: const EdgeInsets.only(left: 32.0),
            color: const Color(0xFF034703),
            height: 200.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLogoAndSocialMediaColumn(),
                _buildPolicyColumn(context),
                _buildSupportColumn(context),
                _buildDownloadAppColumn(),
              ],
            ),
          )
        : Container();
  }

  Column _buildLogoAndSocialMediaColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16.0),
        Image.asset('assets/logo_selorg.png'),
        const Gap(16.0),
        Row(
          children: [
            Image.asset("assets/ic_instagram.png"),
            const Gap(16.0),
            Image.asset("assets/ic_twitter.png"),
            const Gap(16.0),
            Image.asset("assets/ic_facebook.png"),
          ],
        )
      ],
    );
  }

  Column _buildPolicyColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: const Text("Privacy policies",
              style: TextStyle(color: Colors.white)),
          onTap: () => context.router.push(const FaqRoute()),
        ),
        const Gap(16.0),
        GestureDetector(
          child: const Text("Terms and conditions",
              style: TextStyle(color: Colors.white)),
          onTap: () => context.router.push(const FaqRoute()),
        ),
        const Gap(16.0),
        GestureDetector(
          child: const Text("Return and refund policy",
              style: TextStyle(color: Colors.white)),
          onTap: () => context.router.push(const FaqRoute()),
        ),
      ],
    );
  }

  Column _buildSupportColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: const Text("Shipping and delivery",
              style: TextStyle(color: Colors.white)),
          onTap: () => context.router.push(const FaqRoute()),
        ),
        const Gap(16.0),
        GestureDetector(
          child: const Text("Customer support & FAQ",
              style: TextStyle(color: Colors.white)),
          onTap: () => context.router.push(const FaqRoute()),
        ),
        const Gap(16.0),
        GestureDetector(
          child: const Text("Delivery areas",
              style: TextStyle(color: Colors.white)),
          onTap: () => context.router.push(const FaqRoute()),
        ),
      ],
    );
  }

  Column _buildDownloadAppColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Download App", style: TextStyle(color: Colors.white)),
        const Gap(16.0),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            onPressed: null, // Update onPressed with actual logic
            icon: Image.asset("assets/ic_play_store.png"),
            label: const Text(
              "Get it on Play Store",
              style: TextStyle(color: Colors.white),
            )),
        const Gap(8.0),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            onPressed: null, // Update onPressed with actual logic
            icon: Image.asset("assets/ic_app_store.png"),
            label: const Text("Get it on App Store",
                style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
