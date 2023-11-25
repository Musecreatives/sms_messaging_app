// create_message_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_messaging_app/core/app_export.dart';
import 'package:sms_messaging_app/screens/dashboard_screen/dashboard_screen.dart';
import '../import_contacts_screen/import_contacts_screen.dart';
import 'controller/create_messages_controller.dart';

class CreateMessageScreen extends StatelessWidget {
  CreateMessageScreen({super.key});
  final CreateMessageController controller = Get.put(CreateMessageController());
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
         
        leading: IconButton(
          color: AppColor.primaryColor,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.offAll(DashboardScreen());
          },
        ),
        //backgroundColor: AppColor.whiteColor,
        title: Text(
          'Send Messages',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: MessageInputField(controller: controller.messageController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;

  const MessageInputField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: controller,
                  maxLines: null, // Allow multiline input
                  decoration: const InputDecoration(
                    hintText: 'Type your message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SelectRecipientsFab(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectRecipientsFab extends StatelessWidget {
  final CreateMessageController controller = Get.find();

  SelectRecipientsFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bottom dialog
    void _showBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.send),
                  title: Text('Send Now'),
                  subtitle: Text('Message will be delivered immediately'),
                  onTap: () {
                    Get.offAll(() => ImportContactsScreen());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.save),
                  title: Text('Save as Draft'),
                  subtitle: Text('Message will be saved as draft'),
                  onTap: () {
                    _validateAndSaveDraft(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text('Schedule Message'),
                  subtitle: Text('Message will be delivered at a later time'),
                  onTap: () {
                    // Implement logic to schedule messages
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: () {
        // Show the bottom sheet when the user taps the send button
        _showBottomSheet(context);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(29),
      ),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
  void _validateAndSaveDraft(BuildContext context) {
    String? validationMessage =
        controller.messageController.text;

    if (validationMessage.isEmpty) {
      // Show a pop-up message if validation fails
      Get.snackbar(
        'Please enter a message',
        validationMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.actionTextColor,
        colorText: AppColor.whiteColor,
      );
    } else {
      // Validation passed, save draft and navigate
      controller.saveDraftAndNavigateToDrafts();
    }
  }
}
