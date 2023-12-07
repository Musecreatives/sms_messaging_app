import 'package:get/get.dart';

class ImportContactsController extends GetxController {
  RxList<Contact> contacts = <Contact>[].obs;
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
      Contact(name: 'John Doe', phoneNumber: '+1234567890', isSelected: false),
      // Add more contacts as needed
    ]);

    super.onInit();
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  bool isSelected;
  final bool isPaid;

  Contact({
    required this.name,
    required this.phoneNumber,
    this.isSelected = false,
    this.isPaid = false,
  });
}
