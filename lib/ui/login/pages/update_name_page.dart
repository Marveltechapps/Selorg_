import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/ui/login/bloc/cubit/update_name_cubit.dart';

import '../../widgets/buttons.dart';
import '../bloc/state/update_name_state.dart';

@RoutePage()
class UpdateNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<UpdateNameCubit>(), child: UpdateNameScreenContent());
  }

}

class UpdateNameScreenContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UpdateNameScreenContent();
  }

}

class _UpdateNameScreenContent extends State<UpdateNameScreenContent> {
  late TextEditingController _nameFieldController;
  late final FocusNode _nameFocusNode;
  String nameErrorText = "";
  bool nameShowProgress = false;

  @override
  void initState() {
    _nameFieldController = TextEditingController();
    _nameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _buildNameBottomSheet(context),
    );
  }

  Widget _buildNameBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(16.0),
          Text(
            "Please update your name to continue",
            style: TextStyle(fontSize: 18.0),
          ),
          const Gap(16.0),
          TextField(
            controller: _nameFieldController,
            decoration: InputDecoration(
              errorText: nameErrorText,
              counterText: '',
              border: const OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          BlocListener<UpdateNameCubit, UpdateNameState>(
            listener: (_, state) {
              switch(state) {
                case UpdateNameSuccess():
                  context.router.replace(const HomeRoute());
                  break;
                default:

                  break;
              }
            },
            child: SizedBox(
              width: double.infinity,
              child: NormalFilledButton("Submit", () {
                if (_nameFieldController.value.text.isEmpty) {
                  setState(() {
                    nameErrorText = "Name can't be empty";
                  });
                } else {
                  setState(() {
                    nameShowProgress = true;
                  });
                  context.read<UpdateNameCubit>().updateName(_nameFieldController.value.text);
                }
              }, nameShowProgress),
            ),
          )
        ],
      ),
    );
  }

}