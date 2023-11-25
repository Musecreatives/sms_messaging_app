
import 'controller/create_password_controller.dart';
import '../../../core/app_export.dart';

class CreatePasswordScreeen extends StatelessWidget {
  const CreatePasswordScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateNewPasswordController());
    SizeConfig.init(context);

    // Function to show the success pop-up
    void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            buttonText: 'Close',
            description: 'Password has been\nreset successfully',
            title: '',
            onNext: () => Get.offAll(()=> const SignInScreen()),
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
          'Create New Password',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type in a new password',
                style: AppTheme.lightTheme.textTheme.bodyMedium,
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(55),
                    ),
                    Stack(alignment: Alignment.centerRight, children: [
                      AppTextField(
                        textController: controller.passwordController,
                        hintText: '',
                        textTitle: 'New Password',
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Obx(() {
                            return Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColor.primaryColor,
                            );
                          }),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    Stack(alignment: Alignment.centerRight, children: [
                      AppTextField(
                        textController: controller.confirmPasswordController,
                        hintText: '',
                        textTitle: 'Confirm New Password',
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Obx(() {
                            return Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColor.primaryColor,
                            );
                          }),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    AppButton(
                      onPressed: () {
                         showCustomDialog(context);
                      },
                      buttonText: 'Reset Password',
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
