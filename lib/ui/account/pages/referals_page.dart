import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../setting_sections/Common widgets/title_bar.dart';

@RoutePage()
class Referals extends StatelessWidget {
  const Referals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .center, // Ensures children align to the center horizontally
        children: [
          TitleBar(text: 'Referals'), // Assuming TitleBar should be full width
          Padding(
            padding: const EdgeInsets.all(
                16.0), // Optional padding for aesthetic spacing
            child: Text(
              'Welcome to the Referals Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign
                  .center, // Ensures text itself is centered if it wraps to a new line
            ),
          ),
        ],
      ),
    );
  }
}
