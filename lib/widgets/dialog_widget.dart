import '../core/app_export.dart';

class CustomAlertDialog extends StatelessWidget {
  final String description;
  final String title;
  final String buttonText;
  final VoidCallback onNext; // Callback for the "Next" button
  final String imagePath;

  const CustomAlertDialog({
    super.key,
    required this.description,
    required this.title,
    required this.buttonText,
    required this.onNext,
    this.imagePath = 'assets/images/confirm_cicle.png', // Default image path
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor:
          Colors.transparent, // Set the background color to transparent
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      height: getProportionateScreenHeight(380),
      width: getProportionateScreenWidth(double.infinity),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 10),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Image.asset(
              imagePath,
              width: 80.0,
              height: 80.0,
            ),
            Text(
              title,
              style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getProportionateScreenHeight(10.0)),
            Text(
              description,
              style: AppTheme.lightTheme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getProportionateScreenHeight(20.0)),
            AppButton(
              onPressed: onNext,
              buttonText: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
