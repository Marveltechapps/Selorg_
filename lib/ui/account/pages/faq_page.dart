
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injector.dart';
import '../bloc/cubit/faq_cubit.dart';

@RoutePage()
class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<FaqCubit>(), child: const FaqContent());
  }

}

class FaqContent extends StatefulWidget {
  const FaqContent({super.key});

  @override
  State<StatefulWidget> createState() => _FaqContent();
}

class _FaqContent extends State<FaqContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("FAQ"), elevation: 4,),
    body: const Center(child: Text("FAQ screen")));
  }

}