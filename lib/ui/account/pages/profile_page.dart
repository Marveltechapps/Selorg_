import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/ui/account/bloc/cubit/profile_cubit.dart';
import 'package:sel_org/ui/widgets/buttons.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<ProfileCubit>(), child: const ProfileContent());
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileContent();
}

class _ProfileContent extends State<ProfileContent> {
  late TextEditingController _nameFieldController;
  late TextEditingController _phoneFieldController;
  late TextEditingController _emailFieldController;
  late final FocusNode _nameFocusNode;
  late final FocusNode _phoneFocusNode;
  late final FocusNode _emailFocusNode;
  String nameErrorText = "";
  String emailErrorText = "";
  String phoneErrorText = "";
  bool showProgress = false;
  late double screenSize;

  @override
  void initState() {
    _nameFieldController = TextEditingController();
    _phoneFieldController = TextEditingController();
    _emailFieldController = TextEditingController();
    _nameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    _emailFieldController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    context.read<ProfileCubit>().getProfile();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Profile"),
          elevation: 4,
        ),
        body: Container(
            margin: EdgeInsets.only(
                left: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0,
                right: screenSize >= 640 && kIsWeb ? screenSize / 3 : 8.0),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: _nameFieldController,
                  decoration: InputDecoration(
                    errorText: phoneErrorText,
                    counterText: '',
                    border: const OutlineInputBorder(),
                    labelText: "Name",
                  ),
                  focusNode: _nameFocusNode,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _phoneFieldController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    errorText: emailErrorText,
                    counterText: '',
                    border: const OutlineInputBorder(),
                    labelText: "Mobile Number",
                  ),
                  focusNode: _phoneFocusNode,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _emailFieldController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorText: emailErrorText,
                    counterText: '',
                    border: const OutlineInputBorder(),
                    labelText: "Email address",
                  ),
                  focusNode: _emailFocusNode,
                ),
                Text(
                  "We promise not spam you",
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildSubmitButton(context)
              ],
            ))));
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSaved) {
            hideLoading();
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: const Text("Successful",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      content: const Text("Profile updated successfully"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Okay'),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                        ),
                      ],
                    ));
          } else if (state is ProfileLoaded) {
            _nameFieldController.text = state.name;
            _emailFieldController.text = state.email;
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: NormalFilledButton("Submit", () {
            if (_nameFieldController.value.text.isEmpty) {
              setState(() {
                nameErrorText = "Name can't be empty";
              });
            } else if (_emailFieldController.value.text.isEmpty) {
              setState(() {
                emailErrorText = "Email can't be empty";
              });
            } else {
              showLoading();
              context.read<ProfileCubit>().updateProfile(
                  _nameFieldController.value.text,
                  _emailFieldController.value.text);
            }
          }, showProgress),
        ));
  }

  void showLoading() {
    setState(() {
      showProgress = true;
    });
  }

  void hideLoading() {
    setState(() {
      showProgress = false;
    });
  }
}
