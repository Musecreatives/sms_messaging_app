import 'package:get/get.dart';
import 'package:sms_messaging_app/screens/import_contacts_screen/models/import_contacts_model.dart';

class ImportContactsController extends GetxController {
  RxList<ContactInfo> contacts = <ContactInfo>[].obs;
  RxBool showAllUsers = true.obs;
  RxBool showPaidUsers = true.obs;
  RxBool showUnpaidUsers = true.obs;

  void toggleAllUsers(bool value) {
    showAllUsers.value = value;
  }

  void togglePaidUsers(bool value) {
    showPaidUsers.value = value;
  }

  void toggleUnpaidUsers(bool value) {
    showUnpaidUsers.value = value;
  }

  void toggleContactSelection(int index) {
    contacts[index].isSelected = !contacts[index].isSelected;
    update(); // Notify the UI that the data has changed
  }

  void sendMessageToSelectedContacts() {
    // Implement logic to send messages to selected contacts
    final selectedContacts =
        contacts.where((contact) => contact.isSelected).toList();

    // Send messages using the selectedContacts list
    // ...

    // Add any additional logic or feedback to the user if needed
  }

  @override
  void onInit() {
    // Initialize contacts or fetch them from a service
    contacts.addAll([
      ContactInfo(
          name: 'John Doe', phoneNumber: '+1234567890', isSelected: false),
      // Add more contacts as needed
    ]);

    super.onInit();
  }
}

class ContactInfo {
  final String name;
  final String phoneNumber;
  bool isSelected;
  final bool isPaid;

  ContactInfo({
    required this.name,
    required this.phoneNumber,
    this.isSelected = false,
    this.isPaid = false,
  });
}
