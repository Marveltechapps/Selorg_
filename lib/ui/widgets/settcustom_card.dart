import 'package:flutter/material.dart';

import '../../setting_sections/wallet_Section/wallet_screen.dart';

class SettingsCustomCard extends StatelessWidget {
  const SettingsCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Wallet()),
        );
      },
      child: Card(
        color: const Color(0xFFF1E6DE),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Icon with Text
                  Column(
                    children: [
                      IconWithText(icon: Icons.wallet, text: "Selorg Cash"),
                    ],
                  ),
                  // Right side: Two Icons
                  Column(
                    children: [
                      Icon(Icons.arrow_forward_ios),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Icon with Text
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Wallet()),
                            );
                          },
                          child: Text(
                            "Top Up Your Wallet",
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  ),
                  // Right side: Two Icons
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wallet()));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Rounded corners
                            side: const BorderSide(
                                color: Colors.green), // Border color
                          ),
                        ),
                        child: const Text('Add Cash'),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
