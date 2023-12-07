// ignore_for_file: public_member_api_docs, sort_constructors_first
// draft_edit_screen.dart

import 'package:sms_messaging_app/core/app_export.dart';
import 'package:sms_messaging_app/data/models/message/message.dart';
import 'package:sms_messaging_app/screens/drafts_messages_screen/drafts_messages_screen.dart';

import 'controller/edit_drafts_messages_controller.dart';

class DraftEditScreen extends StatelessWidget {
  final UserMessage editDraft;
  const DraftEditScreen({
    super.key,
    required this.editDraft,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final EditDraftController editController = Get.put(EditDraftController());
    TextEditingController messageController =
        TextEditingController(text: editDraft.message);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColor.primaryColor,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: AppColor.whiteColor,
        title: Text(
          'Edit Draft',
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
            // Container(
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: AppColor.whiteColor,
            //     border: Border.all(
            //       color: AppColor.primaryColor,
            //       width: 1.5,
            //     ),
            //     borderRadius: BorderRadius.circular(
            //       getProportionateScreenWidth(5),
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(18.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: TextField(
            //             keyboardType: TextInputType.multiline,
            //             controller: messageController,
            //             maxLines: null, // Allow multiline input
            //             decoration: const InputDecoration(
            //               hintText: 'Type your message...',
            //               border: InputBorder.none,
            //             ),
            //           ),
            //         ),
            //         ElevatedButton(
            //             onPressed: () {
            //               editController.updateDraft(
            //                   userMessage: UserMessage(
            //                 id: editDraft.id,
            //                 message: messageController.text,
            //               ));
            //               Get.offAll(() => DraftsMessagesScreen());
            //             },
            //             child: Text("Save"))
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: MessageInputField(
                  controller: messageController,
                  userMessage: editDraft,
                ),
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
  final UserMessage userMessage;

  const MessageInputField(
      {required this.controller, super.key, required this.userMessage});

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
              SaveDraftButton(
                messageText: controller,
                dataToEdit: userMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SaveDraftButton extends StatelessWidget {
  final TextEditingController messageText;
  final UserMessage dataToEdit;
  final EditDraftController controller = Get.put(EditDraftController());

  SaveDraftButton(
      {super.key, required this.messageText, required this.dataToEdit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.updateDraft(
            userMessage: UserMessage(
          id: dataToEdit.id,
          message: messageText.text,
        ));
        messageText.clear;
        Get.offAll(() => DraftsMessagesScreen());
      },
      child: const Text('Save Draft'),
    );
  }
}
