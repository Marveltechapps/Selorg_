import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/core/router/app_router.dart';

import '../../../core/di/injector.dart';
import '../bloc/cubit/policy_cubit.dart';

@RoutePage()
class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<PolicyCubit>(), child: const PolicyContent());
  }
}

class PolicyContent extends StatefulWidget {
  const PolicyContent({super.key});

  @override
  State<StatefulWidget> createState() => _PolicyContent();
}

class _PolicyContent extends State<PolicyContent> {
  final List<String> listPolicy = <String>["Privacy Policies", "Terms and Conditions", "Return & Refund Policy", "Shipping & Delivery"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Policies"),
          elevation: 4,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: _buildAccountItems(context, listPolicy),
        ));
  }

  Widget _buildAccountItems(BuildContext context, List<String> listPolicy) {
    return ListView.separated(
      itemCount: listPolicy.length,
      itemBuilder: (context, index) {
        return _buildListTile(index);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  Widget _buildListTile(int index) {
    return ListTile(
      title: Text(listPolicy[index]),
      trailing: const Icon(Icons.arrow_right, color: Colors.green),
      onTap: () {
        switch (index) {
          case 0:
            {
              context.router.push(const FaqRoute());
            }
          case 1:
            {
              context.router.push(const FaqRoute());
            }
          case 2:
            {
              context.router.push(const FaqRoute());
            }
          case 3:
            {
              context.router.push(const FaqRoute());
            }
        }
      },
    );
  }
}
