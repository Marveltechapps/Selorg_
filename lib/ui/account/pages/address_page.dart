import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/networking/models/account/address_response.dart';
import 'package:sel_org/ui/account/bloc/cubit/address_cubit.dart';
import 'package:sel_org/ui/widgets/buttons.dart';

import '../../../core/di/injector.dart';
import '../bloc/state/address_state.dart';
import '../model/address_model.dart';

@RoutePage()
class AddressScreen extends StatelessWidget {
  bool isSelection = false;
  AddressScreen(this.isSelection, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<AddressCubit>(),
        child: AddressContent(isSelection));
  }
}

class AddressContent extends StatefulWidget {
  final bool isSelection;
  const AddressContent(this.isSelection, {super.key});

  @override
  State<StatefulWidget> createState() => _AddressContent();
}

class _AddressContent extends State<AddressContent> {
  late AddressCubit addressCubit;
  late double screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    addressCubit = context.read<AddressCubit>();
    addressCubit.getAddress(true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Saved addresses"),
          elevation: 4,
        ),
        body: Container(
            padding: EdgeInsets.only(
                left: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0,
                right: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0,
                top: 24.0),
            child: Column(
              children: [
                Expanded(child: BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    return switch (state) {
                      AddressInitial() => Container(),
                      AddressLoading() => const Center(
                          child: CircularProgressIndicator(
                              color: Colors.greenAccent),
                        ),
                      AddressLoaded() => _buildAddressList(
                          context, state.addressListResponse.addresses),
                      AddressFetchFailed() => Container(),
                      AddressEmpty() => const Center(
                          child: Text(
                              "There is no saved address available. Please add a delivery address to continue."),
                        ),
                      DefaultAddressLoaded() => Container(),
                    };
                  },
                )),
                widget.isSelection
                    ? Container()
                    : NormalFilledButton("Add address", () {
                        context.router.push(const LocationMapRoute());
                      }),
                const Gap(48.0)
              ],
            )));
  }

  Widget _buildAddressList(BuildContext context, List<Address> addresses) {
    return ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return _buildAddressItem(addresses[index]);
        });
  }

  Widget _buildAddressItem(Address address) {
    return GestureDetector(
      onTap: () {
        if (widget.isSelection) {
          addressCubit.saveDefaultAddress(address);
          context.router.pop(true);
        } else {
          final addressModel = AddressModel(
              address.address_id,
              address.label,
              address.address1,
              address.address2,
              address.street,
              address.city,
              address.landmark,
              address.zip,
              address.latitude,
              address.longitude,
              address.isDefault,
              true);
          navigateToAddAddress(context, addressModel);
        }
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                address.isDefault
                    ? "${address.label} (Primary)"
                    : address.label,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Gap(8.0),
              Text(
                  "${address.address1}, ${address.address2}, ${address.city}, ${address.zip}")
            ],
          ),
        ),
      ),
    );
  }

  void navigateToAddAddress(
      BuildContext context, AddressModel addressModel) async {
    final isRefresh =
        await context.router.push(AddAddressRoute(addressModel: addressModel));
    if (isRefresh != null && (isRefresh as bool)) {
      addressCubit.getAddress(true);
    }
  }
}
