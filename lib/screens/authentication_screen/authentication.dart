// ignore_for_file: file_names

import '../../core/app_export.dart';
import '../create_password_screen/create_new_password.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    SizeConfig.init(context);
    // Function to show the success pop-up
    void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            buttonText: 'Next',
            description: 'Click next and Proceed to Create a new password',
            title: 'Authentication Successful',
            onNext: () => Get.to(() => const CreatePasswordScreeen()),
            imagePath: 'assets/images/confirm_cicle.png',
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.whiteColor,
        title: Text(
          'Authentication',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Kindly input the four digit code sent\nto your email to verify this\naccount recovery",
                  style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                      fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                PinVerify(length: 4, controller: controller),
                SizedBox(height: getProportionateScreenHeight(15)),
                Text(
                  "Valid for 5 minutes",
                  style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                      fontSize: 17),
                ),
                SizedBox(height: getProportionateScreenHeight(27)),
                AppButton(
                  buttonText: "Confirm",
                  onPressed: () {
                    showCustomDialog(context);
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
