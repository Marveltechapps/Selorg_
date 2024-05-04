import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/utils/dialog_utils.dart';
import 'package:sel_org/ui/account/bloc/cubit/add_address_cubit.dart';
import 'package:sel_org/ui/account/bloc/state/add_address_state.dart';
import 'package:sel_org/ui/account/model/address_model.dart';

import '../../widgets/buttons.dart';

@RoutePage()
class AddAddressScreen extends StatelessWidget {
  final AddressModel addressModel;

  AddAddressScreen(this.addressModel);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<AddAddressCubit>(),
        child: AddAddressContent(addressModel));
  }
}

class AddAddressContent extends StatefulWidget {
  AddressModel addressModel;

  AddAddressContent(this.addressModel);

  @override
  State<StatefulWidget> createState() => _AddAddressContent();
}

class _AddAddressContent extends State<AddAddressContent> {
  final _formKey = GlobalKey<FormState>();
  late String addressLine1;
  late String addressLine2;
  late String street;
  late String city;
  late String landmark;
  late String pinCode;
  late String label;
  bool loading = false;
  bool deleteLoading = false;
  bool isDefault = false;
  late bool isShowDefaultCheck = false;
  late AddAddressCubit addAddressCubit;
  late double screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    addAddressCubit = context.read<AddAddressCubit>();
    setState(() {
      if (widget.addressModel.isEdit) {
        if (widget.addressModel.isDefault) {
          isShowDefaultCheck = false;
        } else {
          isShowDefaultCheck = true;
        }
      } else {
        isShowDefaultCheck = false;
      }
    });

    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.addressModel.isEdit ? "Edit Address" : "Add Address")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0,
              right: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0,
              top: 16.0,
              bottom: 16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Gap(16.0),
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.words,
                          initialValue: widget.addressModel.isEdit
                              ? widget.addressModel.address1
                              : "",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                            border: OutlineInputBorder(),
                            labelText: "Flat No. & Floor *",
                          ),
                          onSaved: (newValue) =>
                              this.addressLine1 = newValue ?? "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Flat No. & Floor can't be empty *";
                            }
                          },
                        ),
                        const Gap(16.0),
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.words,
                          initialValue: widget.addressModel.isEdit
                              ? widget.addressModel.address2
                              : "",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                            border: OutlineInputBorder(),
                            labelText: "Plot No. & Building *",
                          ),
                          onSaved: (newValue) =>
                              this.addressLine2 = newValue ?? "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Plot No. & Building can't be empty";
                            }
                          },
                        ),
                        const Gap(16.0),
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.words,
                          initialValue: widget.addressModel.isEdit
                              ? widget.addressModel.street
                              : "",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                            border: OutlineInputBorder(),
                            labelText: "Street *",
                          ),
                          onSaved: (newValue) => this.street = newValue ?? "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Street can't be empty";
                            }
                          },
                        ),
                        const Gap(16.0),
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.words,
                          initialValue: widget.addressModel.isEdit
                              ? widget.addressModel.city
                              : "",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                            border: OutlineInputBorder(),
                            labelText: "Area & City *",
                          ),
                          onSaved: (newValue) => this.city = newValue ?? "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Area & City can't be empty";
                            }
                          },
                        ),
                        const Gap(16.0),
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.words,
                          initialValue: widget.addressModel.isEdit
                              ? widget.addressModel.landmark
                              : "",
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                            border: OutlineInputBorder(),
                            labelText: "Landmark (Optional)",
                          ),
                          onSaved: (newValue) => this.landmark = newValue ?? "",
                        ),
                        const Gap(16.0),
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.words,
                          initialValue: widget.addressModel.isEdit
                              ? widget.addressModel.pinCode
                              : "",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                            border: OutlineInputBorder(),
                            labelText: "Pin code *",
                          ),
                          onSaved: (newValue) => this.pinCode = newValue ?? "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Pin code can't be empty";
                            } else if (value.length != 6) {
                              return "Invalid pin code";
                            }
                          },
                        ),
                        const Gap(16.0),
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.words,
                          initialValue: widget.addressModel.isEdit
                              ? widget.addressModel.label
                              : "",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Home, Work or Other",
                            counterText: '',
                            border: OutlineInputBorder(),
                            labelText: "Label *",
                          ),
                          onSaved: (newValue) => this.label = newValue ?? "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Label can't be empty";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocListener<AddAddressCubit, AddAddressState>(
                listener: (context, state) {
                  if (state is AddAddressLoading) {
                    setState(() => loading = true);
                  } else if (state is AddAddressSuccess) {
                    setState(() => loading = false);
                    context.showSuccessDialog("Successful",
                        "Your new address has been added.", close);
                  } else if (state is AddAddressFailed) {
                    setState(() => loading = false);
                    context.showSuccessDialog("Failed",
                        "Failed to create the new address. Please try again after some time.");
                  } else if (state is DeleteAddressLoading) {
                    setState(() => deleteLoading = true);
                  } else if (state is DeleteAddressSuccess) {
                    setState(() => deleteLoading = false);
                    context.showSuccessDialog("Successful",
                        "Address has been deleted successfully.", close);
                  } else if (state is DeleteAddressFailed) {
                    setState(() => deleteLoading = false);
                    context.showSuccessDialog("Failed",
                        "Failed to delete the new address. Please try again after some time.");
                  } else if (state is UpdateAddressSuccess) {
                    setState(() => loading = false);
                    context.showSuccessDialog("Successful",
                        "Address has been updated successfully.", close);
                  } else if (state is UpdateAddressFailed) {
                    setState(() => loading = false);
                    context.showSuccessDialog("Failed",
                        "Failed to update the address. Please try again after some time.");
                  } else if (state is DefaultAddressChanged) {
                    context.showSuccessDialog(
                        "Successful",
                        "${widget.addressModel.label} Address has been set as the default address successfully.",
                        close);
                  } else if (state is DefaultAddressChangeFailed) {
                    setState(() {
                      isDefault = false;
                    });
                    context.showSuccessDialog(
                        "Failed",
                        "Failed to set as the default address. Please try again",
                        close);
                  }
                },
                child: Column(
                  children: [
                    const Gap(8.0),
                    Visibility(
                        visible: isShowDefaultCheck,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isDefault,
                              onChanged: (value) {
                                setState(() {
                                  isDefault = value ?? true;
                                });
                                addAddressCubit.setDefaultAddress(
                                    widget.addressModel.addressId);
                              },
                            ),
                            const Text("Mark this as your default address")
                          ],
                        )),
                    const Gap(16.0),
                    Visibility(
                      visible: widget.addressModel.isEdit ? true : false,
                      child: Column(
                        children: [
                          NormalFilledButton("Delete address", () {
                            addAddressCubit
                                .deleteAddress(widget.addressModel.addressId);
                          }, deleteLoading),
                          const Gap(8.0)
                        ],
                      ),
                    ),
                    NormalFilledButton(
                        widget.addressModel.isEdit
                            ? "Update address"
                            : "Save address", () {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _formKey.currentState!.save());
                        if (widget.addressModel.isEdit) {
                          addAddressCubit.updateAddress(AddressModel(
                              widget.addressModel.addressId,
                              label,
                              addressLine1,
                              addressLine2,
                              street,
                              city,
                              landmark,
                              pinCode,
                              widget.addressModel.latitude,
                              widget.addressModel.longitude,
                              widget.addressModel.isDefault,
                              true));
                        } else {
                          addAddressCubit.addAddress(AddressModel(
                              widget.addressModel.addressId,
                              label,
                              addressLine1,
                              addressLine2,
                              street,
                              city,
                              landmark,
                              pinCode,
                              widget.addressModel.latitude,
                              widget.addressModel.longitude,
                              true,
                              false));
                        }
                      }
                    }, loading),
                    const Gap(16.0)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  close() {
    context.router.pop(true);
  }
}
