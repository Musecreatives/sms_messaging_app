import '../../../core/app_export.dart';

class CreateNewPasswordController extends GetxController {
  // static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  var isPasswordVisible = false.obs;

  // Toggle the password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
