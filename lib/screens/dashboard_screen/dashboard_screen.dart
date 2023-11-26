import 'package:flutter/services.dart';

import '../../core/app_export.dart';
import '../../widgets/drawer.dart';
import '../create_messages_screen/controller/create_messages_controller.dart';
import '../create_messages_screen/create_messages_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final CreateMessageController controller = Get.put(CreateMessageController());
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppColor.whiteColor,
        // automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),

        title: Text(
          'Dashboard',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
        // Add a hamburger icon to open the drawer
      ),
      // Use MyDrawer widget here
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(130),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Send message to\nmultiple contacts',
                          style: AppTheme.lightTheme.textTheme.bodyMedium
                              ?.copyWith(
                            fontSize: getProportionateScreenWidth(16),
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          'Reach your audience',
                          style: AppTheme.lightTheme.textTheme.bodyMedium
                              ?.copyWith(
                            fontSize: getProportionateScreenWidth(13),
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(110),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(57),
                      width: getProportionateScreenWidth(57),
                      child: Image.asset('assets/images/home-send-icon.png'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => CreateMessageScreen());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        label: Text(
          'Compose',
          style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w600,
            color: AppColor.whiteColor,
          ),
        ),
        icon: Image.asset('assets/images/compose_icon.png'),
      ),
    );
  }
}
