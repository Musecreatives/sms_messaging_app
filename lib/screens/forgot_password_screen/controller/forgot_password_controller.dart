// forgot password controller
  import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/app_export.dart';

class ForgotPasswordController extends GetxController {
  // static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  // forgot password firebase
  Future<void> forgotPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim())
          .then((value) => Get.offAll(const SignInScreen()));
      AppSnackBar.showSuccessSnackBar('Reset link sent to your email');
    } catch (e) {
      AppSnackBar.showErrorSnackBar(e.toString());
    }
  }
}


// appsnackbar 
class AppSnackBar {
  static void showSuccessSnackBar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }

  static void showErrorSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }
}