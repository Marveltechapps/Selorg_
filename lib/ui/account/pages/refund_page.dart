
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/ui/account/bloc/cubit/refund_cubit.dart';

import '../../../core/di/injector.dart';

@RoutePage()
class RefundScreen extends StatelessWidget {
  const RefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<RefundCubit>(), child: const RefundContent());
  }

}

class RefundContent extends StatefulWidget {
  const RefundContent({super.key});

  @override
  State<StatefulWidget> createState() => _RefundContent();
}

class _RefundContent extends State<RefundContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Refund"), elevation: 4,),
    body: const Center(child: Text("Refund screen")));
  }

}