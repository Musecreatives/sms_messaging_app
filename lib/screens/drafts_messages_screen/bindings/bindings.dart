import 'package:get/get.dart';
import 'package:sms_messaging_app/screens/drafts_messages_screen/controller/drafts_messages_controller.dart';
import '../../../core/app_export.dart';

// Draft message binding

class DraftMessageBinding implements Bindings{
    @override
    void dependencies(){
        Get.lazyPut<DraftsMessagesController>(() => DraftsMessagesController());
    }
}