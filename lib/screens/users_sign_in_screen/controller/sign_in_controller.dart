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
}
