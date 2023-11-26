// drafts_messages_controller.dart
import 'package:sms_messaging_app/data/models/message/message.dart';

import '../../../core/app_export.dart';
import '../../../data/models/database_helper.dart';

//import '../model/drafts_messages_model.dart';

class DraftsMessagesController extends GetxController {
  final RxList draftMessage = <UserMessage>[].obs;
  RxList get draftMessageList => draftMessage;

  @override
  void onInit() {
    super.onInit();
    _loadDrafts();
  }

  Future<void> _loadDrafts() async {
    final dbHelper = DatabaseHelper.instance;

    final List<Map<String, dynamic>> draftsList = await dbHelper.getDrafts();

    draftMessageList.assignAll(
        draftsList.map((drafts) => UserMessage.fromJson(drafts)).toList());
  }

// Delete drafts feature
  Future<void> deleteDrafts() async {
    final dbHelper = DatabaseHelper.instance;
    await dbHelper
        .deleteOldestDrafts(4); // Specify the number of drafts to delete
    draftMessageList.clear();
    _loadDrafts();
  }
}
