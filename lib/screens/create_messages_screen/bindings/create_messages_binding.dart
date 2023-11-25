import 'package:get/get.dart';
import '../../../core/app_export.dart';
import '../controller/create_messages_controller.dart';

// create message binding

class CreateMessageBinding implements Bindings{
    @override
    void dependencies(){
        Get.lazyPut<CreateMessageController>(() => CreateMessageController());
    }
}