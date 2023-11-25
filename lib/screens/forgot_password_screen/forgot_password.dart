import 'package:sms_messaging_app/screens/authentication_screen/authentication.dart';
import '../../../core/app_export.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.whiteColor,
          title: Text(
            'Forgot Password',
            style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: getProportionateScreenHeight(18),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Opps! Kindly input your email\naddress to fix issue',
                style: AppTheme.lightTheme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    AppTextField(
                      textController: controller.emailController,
                      hintText: 'example@gmail.com',
                      textTitle: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(45),
                    ),
                    AppButton(
                      onPressed: () {
                        Get.to(() => const AuthenticationScreen());
                      },
                      buttonText: 'Submit',
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
