import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:sms_messaging_app/screens/create_messages_screen/create_messages_screen.dart';
import 'package:sms_messaging_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:sms_messaging_app/screens/onboarding_screen/onboarding_screen.dart';
import 'core/app_export.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: DashboardScreen(),
    );
  }
}
