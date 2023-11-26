// drafts_messages_screen.dart
import 'package:flutter/services.dart';
import 'package:sms_messaging_app/core/utils/datetime_convrt.dart';
import 'package:sms_messaging_app/data/models/message/message.dart';
import 'package:sms_messaging_app/widgets/drawer.dart';

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
        // leading: IconButton(
        //   color: AppColor.primaryColor,
        //   icon: const Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
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
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.draftMessageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    UserMessage draft = controller.draftMessageList[index];
                    return InkWell(
                      onTap: () {},
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
                                draft.sender.toString()[0],
                                style: AppTheme.lightTheme.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(10)),
                            Expanded(
                              child: DraftsListTile(
                                title: draft.sender ?? "",
                                content: draft.message ?? "",
                                time: DateTimeConvert.formatDateTime(
                                    draft.time ?? DateTime.now()),
                                onTapEdit: () => Get.to(
                                  () => DraftEditScreen(
                                    editDraft: draft,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: getProportionateScreenHeight(10));
                  },
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
        child: const Icon(Icons.delete),
      ),
    );
  }
}
