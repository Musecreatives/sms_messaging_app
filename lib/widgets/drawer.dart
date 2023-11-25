import 'package:flutter/material.dart';
import 'package:sms_messaging_app/core/app_export.dart';
import 'package:sms_messaging_app/screens/drafts_messages_screen/drafts_messages_screen.dart';

import '../screens/sent_message_screen/sent_message_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            SizedBox(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Text(
                    'Uche Peter',
                    style: AppTheme.lightTheme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(55),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(5)),
                ),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.send,
                  color: AppColor.whiteColor,
                ),
                title: Text(
                  'Sent',
                  style: AppTheme.lightTheme.textTheme.bodyLarge!.copyWith(
                    color: AppColor.whiteColor,
                    fontSize: getProportionateScreenHeight(18),
                  ),
                ),
                onTap: () {
                  // Navigate to the home screen or perform any action
                  Get.to(() => const SentMessagesScreen());
                },
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(55),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(5)),
                ),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.send,
                  color: AppColor.whiteColor,
                ),
                title: Text(
                  'Drafts',
                  style: AppTheme.lightTheme.textTheme.bodyLarge!.copyWith(
                    color: AppColor.whiteColor,
                    fontSize: getProportionateScreenHeight(18),
                  ),
                ),
                onTap: () {
                  // Navigate to the home screen or perform any action
                  Get.to(() => DraftsMessagesScreen());
                },
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(500),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColor.actionTextColor,
              ),
              title: Text(
                'Logout',
                style: AppTheme.lightTheme.textTheme.bodyMedium!.copyWith(
                  color: AppColor.actionTextColor,
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                // Navigate to the home screen or perform any action
                Get.to(() => const SignInScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
