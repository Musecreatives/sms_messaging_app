import 'package:flutter/material.dart';
import 'package:sms_messaging_app/core/app_export.dart';
import 'package:sms_messaging_app/screens/sent_message_screen/sent_message_screen.dart';

class MessageSentSuccessfully extends StatelessWidget {
  const MessageSentSuccessfully({Key? key});

  @override
  Widget build(BuildContext context) {
    // Set the duration you want to show the success screen before navigating
    const Duration duration = Duration(seconds: 2);

    // Schedule a callback to navigate after the specified duration
    Future.delayed(duration, () {
      // Use Navigator to push to the sent messages screen or outbox
      Get.offAll(SentMessagesScreen()); // Replace with your route
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenHeight(203),
            height: getProportionateScreenWidth(203),
            color: AppColor.primaryColor,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Image.asset("assets/images/ic-outline-message.png"),
          ),
          SizedBox(
            height: getProportionateScreenHeight(22),
          ),
          Text(
            'Message has been sent successfully',
            style: AppTheme.lightTheme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
