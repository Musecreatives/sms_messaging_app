// drafts_messages_screen.dart
import 'package:sms_messaging_app/screens/create_messages_screen/create_messages_screen.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_list_tile.dart';
import '../edit_drafts_messages/edit_drafts_messages.dart';
import 'controller/drafts_messages_controller.dart';

class DraftsMessagesScreen extends StatelessWidget {
  DraftsMessagesScreen({super.key});
  final DraftsMessagesController controller =
      Get.put(DraftsMessagesController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColor.primaryColor,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.offAll(CreateMessageScreen());
          },
        ),
        backgroundColor: AppColor.whiteColor,
        title: Text(
          'Drafts',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.drafts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final draft = controller.drafts[index];
                      return MessageCard(
                        message: draft['message'],
                        sender: draft['sender'],
                        time: draft['time'],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: getProportionateScreenHeight(10));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Clear oldest drafts
          controller.deleteDrafts();
        },
        tooltip: 'Clear Oldest Drafts',
        child: Icon(Icons.delete),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
  });

  final String sender;
  final String message;
  final String time;
  

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return InkWell(
      onTap: () {},
      child: Expanded(
        child: Container(
          height: getProportionateScreenHeight(117),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.plansContainerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(8),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                child: Text(
                  sender[0],
                  style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                child: DraftsListTile(
                  title: sender,
                  content: message,
                  time: time,
                  onTapEdit:  () => Get.offAll(()=> DraftEditScreen(
                    editDraft:  message,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
