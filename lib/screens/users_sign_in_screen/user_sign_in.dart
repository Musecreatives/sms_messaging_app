import '../dashboard_screen/dashboard_screen.dart';
import '../forgot_password_screen/forgot_password.dart';
import 'controller/sign_in_controller.dart';
import '../../../core/app_export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    SizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(6),
                ),
                Text(
                  'Enter your email and password\nto log in',
                  style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(55),
                      ),
                      AppTextField(
                        textController: controller.emailController,
                        hintText: 'username@gmail.com',
                        textTitle: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          AppTextField(
                            textController: controller.passwordController,
                            hintText: 'Password',
                            textTitle: 'Password',
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
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (newValue) {
                                  setState(() {
                                    rememberMe = newValue!;
                                  });
                                },
                              ),
                              Text(
                                "Remember Me",
                                style: AppTheme.lightTheme.textTheme.bodyMedium
                                    ?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: AppTheme.lightTheme.textTheme.bodyMedium
                                  ?.copyWith(
                                color: AppColor.actionTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(19),
                      ),
                      AppButton(
                        onPressed: () {
                          Get.to(() => DashboardScreen());
                        },
                        buttonText: 'Log In',
                      ),
                    ],
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
