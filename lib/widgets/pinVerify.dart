// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:async';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../core/app_export.dart';

// ignore: must_be_immutable
class PinVerify extends StatefulWidget {
  int length;
  TextEditingController controller;
  PinVerify({
    super.key,
    required this.length,
    required this.controller,
  });

  @override
  State<PinVerify> createState() => _PinVerifyState();
}

class _PinVerifyState extends State<PinVerify> {
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(90),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: PinCodeTextField(
            appContext: context,
            length: widget.length,
            obscureText: false,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            animationType: AnimationType.fade,
            validator: (value) {
              if (value!.length < 3) {
                return "Fill all the pins";
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 60,
              fieldWidth: 60,
              activeFillColor: Colors.white,
              activeColor: AppColor.textLightColor,
              selectedFillColor: Colors.white,
              selectedColor: AppColor.textLightColor,
              inactiveFillColor: Colors.white,
              inactiveColor: Colors.grey,
            ),
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: widget.controller,
            keyboardType: TextInputType.number,
          ),
        ),
      ),
    );
  }
}
