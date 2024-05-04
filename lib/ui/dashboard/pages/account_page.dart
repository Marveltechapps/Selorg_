import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/ui/dashboard/bloc/cubit/account_cubit.dart';
import 'package:sel_org/ui/dashboard/bloc/state/account_state.dart';
import 'package:sel_org/ui/dashboard/models/account_item.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<AccountCubit>(),
        child: const AccountScreenContent());
  }
}

class AccountScreenContent extends StatefulWidget {
  const AccountScreenContent({super.key});

  @override
  State<StatefulWidget> createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreenContent> {
  final List<AccountItem> accountItems = <AccountItem>[
    AccountItem(
        'Profile',
        const Icon(
          Icons.person_outline,
          color: Colors.green,
        )),
    AccountItem(
        'Orders',
        const Icon(
          Icons.shopping_bag,
          color: Colors.green,
        )),
    AccountItem(
        'Addresses',
        const Icon(
          Icons.location_city,
          color: Colors.green,
        )),
    AccountItem(
        'Refunds',
        const Icon(
          Icons.money,
          color: Colors.green,
        )),
    AccountItem(
        'Policies',
        const Icon(
          Icons.info,
          color: Colors.green,
        )),
    AccountItem(
        'Customer support & FAQ',
        const Icon(
          Icons.message,
          color: Colors.green,
        )),
    AccountItem(
        'Log out',
        const Icon(
          Icons.logout,
          color: Colors.green,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      child: BlocListener<AccountCubit, AccountState>(
          listener: (context, state) {
            if (state is AccountLogOut) {
              context.router.replaceAll([const LoginRoute()]);
            }
          },
          child: Container(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hello, Santhosh P",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 24),
                  Expanded(child: _buildAccountItems(context, accountItems)),
                ],
              ))),
    );
  }

  Widget _buildAccountItems(
      BuildContext context, List<AccountItem> accountItems) {
    return ListView.separated(
      itemCount: accountItems.length,
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
      title: Text(accountItems[index].title),
      leading: accountItems[index].icon,
      trailing: const Icon(Icons.arrow_right, color: Colors.green),
      onTap: () {
        switch (index) {
          case 0:
            {
              context.router.push(const ProfileRoute());
            }
          case 1:
            {
              context.router.push(const OrdersRoute());
            }
          case 2:
            {
              context.router.push(AddressRoute(isSelection: false));
            }
          case 3:
            {
              context.router.push(const RefundRoute());
            }
          case 4:
            {
              context.router.push(const PolicyRoute());
            }
          case 5:
            {
              context.router.push(const FaqRoute());
            }
          case 6:
            {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text(
                            "Do you really want to log out from the app ?"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Okay'),
                            onPressed: () {
                              context.read<AccountCubit>().logOut();
                            },
                          ),
                        ],
                      ));
            }
        }
      },
    );
  }
}
