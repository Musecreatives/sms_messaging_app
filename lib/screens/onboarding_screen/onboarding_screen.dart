// onboarding screen
import '../../core/app_export.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(126),
          ),
          SizedBox(
            height: getProportionateScreenHeight(300),
            width: double.infinity,
            child: Image.asset('assets/images/onboarding_image.png'),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Text(
            'Hello',
            style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
              color: AppColor.blackColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
           'Send message to multiple contacts\nand reach your audience',
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
              fontSize: getProportionateScreenWidth(16),
              color: AppColor.blackColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: AppButton(
              buttonText: 'Log In',
              onPressed: () {
                Get.offAll(() => const SignInScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
