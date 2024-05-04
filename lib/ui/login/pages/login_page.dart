import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/core/utils/dimens.dart';
import 'package:sel_org/ui/login/bloc/cubit/login_cubit.dart';
import 'package:sel_org/ui/login/bloc/state/login_state.dart';
import '../../../core/di/injector.dart';
import '../../../networking/models/login/login_request.dart';
import '../../widgets/buttons.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<LoginCubit>(), child: const LoginForm());
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool isLoading = false;
  bool isLoginEnabled = true;
  late String errorText = "";
  late final TextEditingController _mobileFieldController;
  late final FocusNode _focusNode;
  late double screenSize;

  @override
  void initState() {
    _mobileFieldController = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _mobileFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    final router = AutoRouter.of(context);
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(
                left: context.getPadding(), right: context.getPadding()),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF034703), Color(0xFF00A85A)])),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo_selorg.png'),
                const Gap(24.0),
                const Padding(
                  padding: EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Text(
                    "Organic groceries delivered in 10 minutes",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Gap(32.0),
                const Text(
                  "Enter your 10 digit mobile number",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const Gap(32.0),
                TextField(
                  controller: _mobileFieldController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.green,
                      errorText: errorText,
                      counterText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.white)),
                      prefixText: "+91",
                      prefixIcon: const Icon(Icons.mobile_friendly)),
                  focusNode: _focusNode,
                ),
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      showProgress();
                    } else if (state is LoginSuccess) {
                      hideProgress();
                      router.push(OtpVerifyRoute(
                          mobileNumber: _mobileFieldController.value.text));
                    } else if (state is LoginError) {
                      hideProgress();
                      showError(state.errorMessage);
                    }
                  },
                  child: SizedBox(
                      width: double.infinity,
                      child: NormalFilledButton(
                        "Get OTP",
                        () {
                          if (_mobileFieldController.value.text.length == 10) {
                            _focusNode.unfocus();
                            hideError();
                            context.read<LoginCubit>().login(LoginRequest(
                                _mobileFieldController.value.text));
                          } else {
                            showError("Invalid mobile number");
                          }
                        },
                        isLoading,
                      )),
                ),
              ],
            ))));
  }

  void showProgress() {
    setState(() {
      isLoading = true;
    });
  }

  void hideProgress() {
    setState(() {
      isLoading = false;
    });
  }

  void showError(String errorMessage) {
    setState(() {
      errorText = errorMessage;
    });
  }

  void hideError() {
    setState(() {
      errorText = "";
    });
  }
}
