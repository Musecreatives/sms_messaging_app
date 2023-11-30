import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_messaging_app/screens/dashboard_screen/dashboard_screen.dart';

import '../../../core/app_export.dart';

class SignInController extends GetxController {
  // static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isPasswordVisible = false.obs;

  // Toggle the password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // firebase sign up
  void signIn() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.length > 8) {
      try {
        final auth = FirebaseAuth.instance;
        await auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        Get.offAll(DashboardScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            'No user found for that email.',
            'Please try again',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.primaryColor,
            colorText: AppColor.whiteColor,
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            'Wrong password provided for that user.',
            'Please try again',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.primaryColor,
            colorText: AppColor.whiteColor,
          );
        }
      }
    }
  }
}
