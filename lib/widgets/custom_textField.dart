// ignore_for_file: file_names

import '../core/app_export.dart';

class AppTextField extends StatelessWidget {
  final String textTitle;
  final TextEditingController textController;
  final Function(String)? onChanged;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  // ignore: prefer_typing_uninitialized_variables
  final suffixIcon;
  final bool isPassword; // New parameter for password field

  const AppTextField({
    super.key,
    this.suffixIcon,
    this.obscureText = false,
    required this.textTitle,
    required this.textController,
    this.onChanged,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false, // Default to non-password field
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    Widget? suffixIcon;

    // // Check if it's a password field to show the visibility icon
    // if (isPassword && keyboardType == TextInputType.visiblePassword) {
    //   suffixIcon = IconButton(
    //     icon: Icon(
    //       obscureText ? Icons.visibility : Icons.visibility_off,
    //       color: AppColor.black70Color,
    //     ),
    //     onPressed: () {
    //       onChanged?.call(""); // Toggle visibility
    //     },
    //   );
    // }

    return SizedBox(
      height: getProportionateScreenHeight(56),
      width: double.infinity,
      child: TextField(
        obscureText: obscureText,
        controller: textController,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: textTitle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: AppTheme.lightTheme.textTheme.bodyMedium,
          hintText: hintText,
          hintStyle: AppTheme.lightTheme.textTheme.bodyMedium,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusColor: AppColor.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: AppColor.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
