// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sms_messaging_app/screens/create_messages_screen/controller/create_messages_controller.dart';
import 'package:sms_messaging_app/screens/dashboard_screen/dashboard_screen.dart';

import 'package:sms_messaging_app/screens/import_contacts_screen/widget/multi_select.dart';

import '../../core/app_export.dart';
import '../../widgets/drawer.dart';

import 'package:twilio_flutter/twilio_flutter.dart';

class ImportContactsScreen extends StatefulWidget {
  final String? message;
  const ImportContactsScreen({
    super.key,
    this.message,
  });

  @override
  State<ImportContactsScreen> createState() => _ImportContactsScreenState();
}

class _ImportContactsScreenState extends State<ImportContactsScreen> {
  String selectedContactsText = '';
  TwilioFlutter? twilioFlutter;
  @override
  void initState() {
    super.initState();
    _askPermissions();

    twilioFlutter = TwilioFlutter(
      accountSid: '${dotenv.env['accountSid']}',
      authToken: '${dotenv.env['authToken']}',
      twilioNumber: '${dotenv.env['twilioNumber']}',
    );
  }

  void sendSms(String number, String message) async {
    twilioFlutter?.sendSMS(toNumber: number, messageBody: message);
  }

  Future<void> _askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CreateMessageController());
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          'Send Message',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
      ),
      // Use MyDrawer widget here
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                List<Contact>? selectedContacts = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MultiContactPicker(),
                  ),
                );

                // Handle selected contacts
                if (selectedContacts != null && selectedContacts.isNotEmpty) {
                  // Do something with selectedContacts

                  selectedContactsText = selectedContacts
                      .map((e) => e.phones?.first.value ?? '')
                      .join(',');
                  setState(() {});
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Select from phonebook",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColor.whiteColor),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "From CSV file",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text('Send to: $selectedContactsText'),
            Text('Message: ${widget.message}')
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendSms(selectedContactsText, '${widget.message}');
          controller.messageController.clear();
          Get.offAll(() => DashboardScreen());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset('assets/images/sendIcon.png'),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: ListView.separated(
      //           itemCount: 4,
      //           separatorBuilder: (context, index) => SizedBox(
      //             height: getProportionateScreenHeight(16),
      //           ),
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: double.infinity,
      //               height: getProportionateScreenHeight(70),
      //               decoration: BoxDecoration(
      //                 color: AppColor.primaryColor,
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(getProportionateScreenWidth(5)),
      //                 ),
      //               ),
      //               child: ListTile(
      //                 title: Text(
      //                   'John',
      //                   style: AppTheme.lightTheme.textTheme.bodyMedium!
      //                       .copyWith(
      //                     color: AppColor.whiteColor,
      //                   ),
      //                 ),
      //                 subtitle: Text(
      //                   '-902 ',
      //                   style: AppTheme.lightTheme.textTheme.bodyMedium!
      //                       .copyWith(
      //                     color: AppColor.whiteColor,
      //                   ),
      //                 ),
      //                 trailing: Container(
      //                   width: getProportionateScreenHeight(25),
      //                   height: getProportionateScreenHeight(25),
      //                   decoration: const BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     color: AppColor.whiteColor,
      //                   ),
      //                   child: const Icon(
      //                     Icons.check,
      //                     color: AppColor.primaryColor,
      //                   ),
      //                 ),
      //                 onTap: () {
      //                   // Toggle the selection status on tap
      //                   // controller.toggleContactSelection(index);
      //                 },
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   height: 110,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Row(
      //         children: [
      //           // Obx(
      //           //   () => Checkbox(
      //           //     value: controller.showAllUsers.value,
      //           //     onChanged: (bool? value) {
      //           //       if (value != null) {
      //           //         controller.toggleAllUsers(value);
      //           //       }
      //           //     },
      //           //   ),
      //           // ),
      //           Text(
      //             'All Users',
      //             style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
      //               fontSize: 12,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           // Obx(
      //           //   () => Checkbox(
      //           //     value: controller.showPaidUsers.value,
      //           //     onChanged: (bool? value) {
      //           //       if (value != null) {
      //           //         controller.togglePaidUsers(value);
      //           //       }
      //           //     },
      //           //   ),
      //           // ),
      //           Text(
      //             'Paid Users',
      //             style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
      //               fontSize: 12,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           // Obx(
      //           //   () => Checkbox(
      //           //     value: controller.showUnpaidUsers.value,
      //           //     onChanged: (bool? value) {
      //           //       if (value != null) {
      //           //         controller.toggleUnpaidUsers(value);
      //           //       }
      //           //     },
      //           //   ),
      //           // ),
      //           Text(
      //             'Unpaid Users',
      //             style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
      //               fontSize: 12,
      //             ),
      //           ),
      //         ],
      //       ),
      //       InkWell(
      //         onTap: () {
      //           // Implement logic to send messages
      //           // controller.sendMessageToSelectedContacts;
      //         },
      //         child: Container(
      //           width: 40,
      //           height: 40,
      //           decoration: const BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: AppColor.primaryColor,
      //           ),
      //           child: const Icon(
      //             Icons.send,
      //             color: Colors.white,
      //             size: 20.0,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );

// bottom dialog
  }
}
