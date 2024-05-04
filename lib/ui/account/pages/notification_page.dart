import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../setting_sections/Common widgets/title_bar.dart';
import '../bloc/cubit/notification_cubit.dart';
import '../bloc/state/notification_state.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: Scaffold(
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            double width = MediaQuery.of(context).size.width;
            bool mobile = width < 600;
            return Column(
              children: [
                TitleBar(text: "Notification"),
                Padding(
                  padding:
                      width > 650 ? EdgeInsets.all(50.0) : EdgeInsets.all(0),
                  child: Container(
                    width: mobile ? width : width,
                    height: mobile ? 60 : 80,
                    padding: EdgeInsets.all(mobile ? 8 : 12),
                    decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("WhatsApp Messages",
                                style: TextStyle(
                                    fontSize: mobile ? 16 : 20,
                                    fontWeight: FontWeight.w600)),
                            Text("Get updates from us on WhatsApp",
                                style: TextStyle(fontSize: mobile ? 14 : 17)),
                          ],
                        ),
                        Switch(
                          value: state.isOn,
                          onChanged: (value) {
                            context
                                .read<NotificationCubit>()
                                .toggleSwitch(value);
                          },
                          activeColor: const Color(0xFF034703),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
