// ignore_for_file: file_names

import 'package:flutter/services.dart';
import 'package:sms_messaging_app/widgets/drawer.dart';

import '../../core/app_export.dart';

class SentMessagesScreen extends StatelessWidget {
  const SentMessagesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sent Messages',
          style: AppTheme.lightTheme.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24)),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  height: getProportionateScreenHeight(117),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.plansContainerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        'Yesterday',
                        style:
                            AppTheme.lightTheme.textTheme.bodyMedium!.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                      trailing: Text(
                        '12:00',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  height: getProportionateScreenHeight(117),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.plansContainerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        'Yesterday',
                        style:
                            AppTheme.lightTheme.textTheme.bodyMedium!.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                      trailing: Text(
                        '12:00',
                        style:
                            AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  height: getProportionateScreenHeight(117),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.plansContainerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        '22nd, October',
                        style:
                            AppTheme.lightTheme.textTheme.bodyMedium!.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                      trailing: Text(
                        '12:00',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
