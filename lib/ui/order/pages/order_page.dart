import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sel_org/core/utils/dialog_utils.dart';
import 'package:sel_org/ui/order/bloc/cubit/order_cubit.dart';
import 'package:sel_org/ui/widgets/buttons.dart';

import '../../../core/di/injector.dart';
import '../bloc/state/order_state.dart';

@RoutePage()
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<OrderCubit>(), child: const OrderContent());
  }
}

class OrderContent extends StatefulWidget {
  const OrderContent({super.key});

  @override
  State<StatefulWidget> createState() => _OrderContent();
}

class _OrderContent extends State<OrderContent> {
  bool loading = false;
  late OrderCubit orderCubit;
  late double totalPrice = 0.0;
  final paymentOptions = ["Cash on delivery", "UPI", "Cards"];
  int? selectedOption;
  late double screenSize;
  String? selectedPaymentMethod;
  int? selectedRadio;
  List<WalletOption> walletOptions = [
    WalletOption(imagePath: 'assets/paytm.png', title: 'Paytm', isButton: true),
    WalletOption(
        imagePath: 'assets/amazonpay.png',
        title: 'Amazon Pay Balance',
        isButton: true),
    WalletOption(imagePath: 'assets/phonepe.png', title: 'Phonepe'),
    WalletOption(
        imagePath: 'assets/mobikwik.png', title: 'MobiKwik | ZIP(Pay later)'),
    WalletOption(imagePath: 'assets/freecharge.png', title: 'Freecharge'),
  ];

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    orderCubit = context.read<OrderCubit>();
    orderCubit.calculateTotalPrice();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Payment Method",
            textAlign: TextAlign.center,
          ),
          elevation: 4,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        16.0), // Adds padding to align the rows more consistently on the left and right
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Aligns items to space between
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          "Order Amount",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 8.0), // Provides some spacing between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Aligns items to space between
                      children: [
                        const Text(
                          "other",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          "RS $totalPrice",
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0), // Adds space below the rows
                  ],
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("UPI",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/upi.png',
                              ),
                            ),
                          ),
                        ), // UPI Icon
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pay by any UPI app",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("Use any UPI app on your phone to pay",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                        Radio(
                          focusColor: Colors.black26,
                          value: "UPI",
                          groupValue: selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // GPay logo and label
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/gpay.png'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text("GPay", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const Gap(16),
                        // PhonePe logo and label
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/phonepe.png'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text("PhonePe",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        // Amazon Pay logo and label
                        const Gap(16),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/amazonpay.png'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text("Amazon Pay",
                                style: TextStyle(fontSize: 12)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pluxee | Sodexo ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/pluxee.png',
                              ),
                            ),
                          ),
                        ), // UPI Icon
                        const SizedBox(width: 10),
                        const Text("Pluxee|Sodexo Meal Card ",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Cards",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/credit_card.png',
                              ),
                            ),
                          ),
                        ), // UPI Icon
                        const SizedBox(width: 10),
                        const Text("Credit / Debit card",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Wallet",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: walletOptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = walletOptions[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                // Add your onTap functionality here if needed
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(option.imagePath),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(option.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                )),
                            Spacer(),
                            option.isButton
                                ? TextButton(
                                    onPressed: () {
                                      // Handle button press
                                    },
                                    child: const Text(
                                      "Link Account",
                                      style: TextStyle(fontSize: 9),
                                    ),
                                  )
                                : Radio(
                                    value: index,
                                    groupValue: selectedRadio,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedRadio = value!;
                                      });
                                    },
                                  ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Set borderRadius to zero for rectangular corners
                            ),
                          ),
                          onPressed: () {
                            context.router.pop();
                          },
                          child: const Text(
                            "Other Wallets",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Net Banking",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // GPay logo and label
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/sbi.png'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text("SBI", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const Gap(16),
                        // PhonePe logo and label
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/hdfc.png'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text("HDFC", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        // Amazon Pay logo and label
                        const Gap(16),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/icici.png'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text("ICICI", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const Gap(16),
                        // PhonePe logo and label
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/axix.png'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text("Axis", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Gap(16),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Set borderRadius to zero for rectangular corners
                            ),
                          ),
                          onPressed: () {
                            context.router.pop();
                          },
                          child: const Text(
                            "Other UPI Option",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pay on Delivery",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/cod.png',
                              ),
                            ),
                          ),
                        ), // UPI Icon
                        const SizedBox(width: 10),
                        const Text("Cash on Delivery",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              BlocListener<OrderCubit, OrderState>(
                listener: (context, state) {
                  if (state is TotalPrice) {
                    final finalPrice = state.finalPrice;
                    setState(() {
                      totalPrice = finalPrice;
                    });
                  } else if (state is CreateOrderLoading) {
                    showLoading(true);
                  } else if (state is CreateOrderFailed) {
                    showLoading(false);
                    context.showSuccessDialog("Failed",
                        "Your order failed to create. Please try again.");
                  } else if (state is CreateOrderSuccess) {
                    showLoading(false);
                    context.showSuccessDialog("Successful",
                        "Your order has been created successfully.", close);
                  }
                },
                child: selectedOption != null
                    ? Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenSize >= 640 && kIsWeb
                                  ? screenSize / 3
                                  : 8.0,
                              right: screenSize >= 640 && kIsWeb
                                  ? screenSize / 3
                                  : 8.0,
                              top: 16.0,
                              bottom: 16.0),
                          child: NormalFilledButton("Place Order", () {
                            orderCubit.createOrder();
                          }, loading),
                        ),
                      )
                    : Container(),
              )
            ],
          ),
        ));
  }

  void showLoading(bool isShowLoading) {
    setState(() {
      loading = isShowLoading;
    });
  }

  void close() {
    context.router.pop(true);
  }
}

class WalletOption {
  final String imagePath;
  final String title;
  final bool isButton;

  WalletOption(
      {required this.imagePath, required this.title, this.isButton = false});
}
// const Text("Choose payment options"),
// const Gap(16.0),
// Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//     RadioListTile<int>(
//       title: const Text("Cash on delivery"),
//       value: 1,
//       groupValue: selectedOption,
//       onChanged: (int? value) {
//         setState(() {
//           selectedOption = value;
//         });
//       },
//     ),
//     RadioListTile<int>(
//       title: const Text('UPI'),
//       value: 2,
//       groupValue: selectedOption,
//       onChanged: (int? value) {
//         setState(() {
//           selectedOption = value;
//         });
//       },
//     ),
//     RadioListTile<int>(
//       title: const Text('Cards'),
//       value: 3,
//       groupValue: selectedOption,
//       onChanged: (int? value) {
//         setState(() {
//           selectedOption = value;
//         });
//       },
//     ),
//   ],
// ),
