import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sel_org/core/di/injector.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/core/utils/dimens.dart';
import 'package:sel_org/ui/login/bloc/state/otp_verify_state.dart';

import '../../widgets/buttons.dart';
import '../bloc/cubit/otp_verify_cubit.dart';

@RoutePage()
class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({required this.mobileNumber});

  String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<OtpVerifyCubit>(),
        child: OtpVerifyForm(mobileNumber));
  }
}

class OtpVerifyForm extends StatefulWidget {
  OtpVerifyForm(this.mobileNumber, {super.key});

  String mobileNumber;

  @override
  State<StatefulWidget> createState() => OtpVerifyState();
}

class OtpVerifyState extends State<OtpVerifyForm> {
  int timerCount = 30;
  int countDownMax = 30;
  bool enableResend = false;
  late Timer timer;
  String errorText = "";
  String pin = "";
  String resendText = "";
  bool showVerify = false;
  bool showProgress = false;
  late double screenSize;

  @override
  void initState() {
    onResend();
    super.initState();
  }

  @override
  void dispose() {
    timerCount = 0;
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: context.getPadding(), right: context.getPadding()),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF034703), Color(0xFF00A85A)])),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/logo_selorg.png'),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Mobile number verification",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "OTP has been sent to your mobile number ${widget.mobileNumber}. Please enter the code below to complete login.",
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Pinput(
              length: 4,
              showCursor: true,
              forceErrorState: true,
              errorText: errorText,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              onCompleted: (pin) {
                this.pin = pin;
                setState(() {
                  showVerify = true;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: enableResend ? onResend : null,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "$resendText${timerCount == 0 ? "" : timerCount.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: Visibility(
                visible: showVerify,
                child: BlocListener<OtpVerifyCubit, OtpVerificationState>(
                  listener: (blocContext, state) {
                    if (state is OtpVerifyLoading) {
                      showLoadingProgress();
                    } else if (state is OtpVerifySuccess) {
                      blocContext.router.replaceAll([const DashboardRoute()]);
                    } else if (state is OtpVerifyError) {
                      setState(() {
                        errorText = state.errorMessage;
                        print(errorText);
                      });
                      hideProgress();
                    } else if (state is NameMissing) {
                      context.router.replaceAll([const UpdateNameRoute()]);
                    }
                  },
                  child: NormalFilledButton("Verify", () {
                    setState(() {
                      errorText = "";
                    });
                    context
                        .read<OtpVerifyCubit>()
                        .verifyOtp(widget.mobileNumber, pin);
                  }, showProgress),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void showLoadingProgress() {
    setState(() {
      showProgress = true;
    });
  }

  void hideProgress() {
    setState(() {
      showProgress = false;
    });
  }

  void onResend() {
    setState(() {
      resendText = "Didn't receive code? You can resend code in 00:";
      enableResend = false;
      timerCount = 30;
    });
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timerCount--;
        if (timerCount == 0) {
          resendText = "Resend OTP";
          enableResend = true;
          timer.cancel();
        }
      });
    });
  }
}
