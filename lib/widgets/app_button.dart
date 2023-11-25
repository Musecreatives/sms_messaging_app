import '/core/app_export.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonWidth = double.infinity,
    this.isEnabled = true,
  });
  final String buttonText;
  final Function() onPressed;
  final double buttonWidth;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: buttonWidth,
      height: getProportionateScreenHeight(50),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isEnabled
              ? MaterialStateProperty.all<Color>(
                  AppColor.primaryColor,
                )
              : MaterialStateProperty.all<Color>(
                  AppColor.primaryColor.withOpacity(0.5),
                ),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
