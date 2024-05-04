import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../setting_sections/Common widgets/title_bar.dart';
import '../../widgets/generalinfo_widget.dart';
import '../bloc/cubit/generalinfo_cubit.dart';

@RoutePage()
class GeneralPolicyScreen extends StatelessWidget {
  const GeneralPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600;

    return BlocProvider(
      create: (context) => GeneralPolicyCubit(),
      child: Scaffold(
        body: Column(
          children: [
            TitleBar(text: "Policies"),
            Container(
              alignment: Alignment.centerLeft,
              padding: mobile
                  ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                  : const EdgeInsets.symmetric(vertical: 64, horizontal: 64),
              child: Column(
                children: [
                  PolicyWidget(
                      icon: "assets/note_icon.png",
                      text: "Terms & Conditions",
                      mobile: mobile),
                  const SizedBox(height: 20),
                  PolicyWidget(
                      icon: "assets/lock_icon.png",
                      text: "Privacy Policy",
                      mobile: mobile),
                  const SizedBox(height: 20),
                  PolicyWidget(
                      icon: "assets/open_icon.png",
                      text: "Open Source Licence",
                      mobile: mobile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
