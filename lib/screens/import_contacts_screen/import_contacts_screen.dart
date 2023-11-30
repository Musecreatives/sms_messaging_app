import 'package:flutter/services.dart';

import '../../core/app_export.dart';
import '../../widgets/drawer.dart';
import 'controller/import_contacts_controller.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ImportContactsScreen extends StatefulWidget {
  @override
  State<ImportContactsScreen> createState() => _ImportContactsScreenState();
}

class _ImportContactsScreenState extends State<ImportContactsScreen> {
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
      });
    } else {
      // Handle the case when permission is denied
      // You might want to show a dialog or request the permission again
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:  const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          'Imported Contacts',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
      ),
      // Use MyDrawer widget here
      drawer: const MyDrawer(),
      body: _contacts.isNotEmpty
          ? ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_contacts[index].displayName ?? ''),
                  subtitle: Text(_contacts[index].phones?.first.value ?? ''),
                  onTap: () {
                    // Implement the logic to send messages to the selected contact
                    _sendMessageToContact(_contacts[index]);
                  },
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void _sendMessageToContact(Contact contact) {
    // Implement the logic to send messages to the selected contact
    // You might navigate to another screen or handle the message sending here
    print('Sending message to ${contact.displayName}');
  }
  // body: Padding(
  //   padding: const EdgeInsets.all(16.0),
  //   child: Column(
  //     children: [
  //       Expanded(child: Text('data'),
  //         // child: Obx(
  //         //   // () => ListView.separated(
  //         //   //   itemCount: controller.contacts.length,
  //         //   //   separatorBuilder: (context, index) => SizedBox(
  //         //   //     height: getProportionateScreenHeight(16),
  //         //   //   ),
  //         //   //   itemBuilder: (context, index) {
  //         //   //     return Container(
  //         //   //       width: double.infinity,
  //         //   //       height: getProportionateScreenHeight(70),
  //         //   //       decoration: BoxDecoration(
  //         //   //         color: AppColor.primaryColor,
  //         //   //         borderRadius: BorderRadius.all(
  //         //   //           Radius.circular(getProportionateScreenWidth(5)),
  //         //   //         ),
  //         //   //       ),
  //         //   //       child: ListTile(
  //         //   //         title: Text(
  //         //   //           'John',
  //         //   //           style: AppTheme.lightTheme.textTheme.bodyMedium!
  //         //   //               .copyWith(
  //         //   //             color: AppColor.whiteColor,
  //         //   //           ),
  //         //   //         ),
  //         //   //         subtitle: Text(
  //         //   //           '-902 ',
  //         //   //           style: AppTheme.lightTheme.textTheme.bodyMedium!
  //         //   //               .copyWith(
  //         //   //             color: AppColor.whiteColor,
  //         //   //           ),
  //         //   //         ),
  //         //   //         trailing: Container(
  //         //   //           width: getProportionateScreenHeight(25),
  //         //   //           height: getProportionateScreenHeight(25),
  //         //   //           decoration: BoxDecoration(
  //         //   //             shape: BoxShape.circle,
  //         //   //             color: AppColor.whiteColor,
  //         //   //           ),
  //         //   //           child: Icon(
  //         //   //             Icons.check,
  //         //   //             color: AppColor.primaryColor,
  //         //   //           ),
  //         //   //         ),
  //         //   //         onTap: () {
  //         //   //           // Toggle the selection status on tap
  //         //   //           controller.toggleContactSelection(index);
  //         //   //         },
  //         //   //       ),
  //         //   //     );
  //         //   //   },
  //         //   // ),
  //         // ),
  //       ),
  //     ],
  //   ),
  // ),
  // bottomNavigationBar: BottomAppBar(
  //   height: 110,
  //   child: Container(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Row(
  //           children: [
  //             // Obx(
  //             //   () => Checkbox(
  //             //     value: controller.showAllUsers.value,
  //             //     onChanged: (bool? value) {
  //             //       if (value != null) {
  //             //         controller.toggleAllUsers(value);
  //             //       }
  //             //     },
  //             //   ),
  //             // ),
  //             Text(
  //               'All Users',
  //               style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             // Obx(
  //             //   () => Checkbox(
  //             //     value: controller.showPaidUsers.value,
  //             //     onChanged: (bool? value) {
  //             //       if (value != null) {
  //             //         controller.togglePaidUsers(value);
  //             //       }
  //             //     },
  //             //   ),
  //             // ),
  //             Text(
  //               'Paid Users',
  //               style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             // Obx(
  //             //   () => Checkbox(
  //             //     value: controller.showUnpaidUsers.value,
  //             //     onChanged: (bool? value) {
  //             //       if (value != null) {
  //             //         controller.toggleUnpaidUsers(value);
  //             //       }
  //             //     },
  //             //   ),
  //             // ),
  //             Text(
  //               'Unpaid Users',
  //               style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ],
  //         ),
  //         InkWell(
  //           onTap: () {
  //             // Implement logic to send messages
  //               // controller.sendMessageToSelectedContacts;
  //           },
  //           child: Container(
  //             width: 40,
  //             height: 40,
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: AppColor.primaryColor,
  //             ),
  //             child: Icon(
  //               Icons.send,
  //               color: Colors.white,
  //               size: 20.0,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // ),
}

// bottom dialog
