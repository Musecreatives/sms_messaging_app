// drafts_messages_controller.dart
import '../../../core/app_export.dart';
import '../../../data/models/database_helper.dart';
import 'package:intl/intl.dart';

import '../../edit_drafts_messages/edit_drafts_messages.dart';
//import '../model/drafts_messages_model.dart';

class DraftsMessagesController extends GetxController {
  final RxList drafts = [].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDrafts();
  }

  Future<void> _loadDrafts() async {
    final dbHelper = DatabaseHelper.instance;
    final List<Map<String, dynamic>> draftsList = await dbHelper.getDrafts();

    // Format the date in each draft
    final List<Map<String, dynamic>> formattedDrafts = draftsList.map((draft) {
      return {
        ...draft,
        'formattedDate': _formatTime(draft['createdAt'] ??""),
      };
    }).toList();

    drafts.assignAll(formattedDrafts);
  }

   String _formatTime(String? createdAt) {
    if (createdAt != null) {
      try {
        final  dateTime = DateTime.parse(createdAt);
        final String formattedTime = DateFormat('hh:mm a' ).format(dateTime);
        final Duration difference = DateTime.now().difference(dateTime);
        final int minutes = difference.inMinutes;

        if (minutes < 1) {
          return 'Just now';
        } else if (minutes < 60) {
          return '$minutes min ago';
        } else {
          return formattedTime;
        }
      } catch (e) {
        return 'Invalid Time'; // Or any default value you prefer for invalid times
      }
    } else {
      return 'N/A'; // Or any default value you prefer for null times
    }
  }

// Delete drafts feature
  Future<void> deleteDrafts() async {
    final dbHelper = DatabaseHelper.instance;
    await dbHelper.deleteOldestDrafts(4); // Specify the number of drafts to delete
    drafts.clear();
    _loadDrafts();
  }
}
