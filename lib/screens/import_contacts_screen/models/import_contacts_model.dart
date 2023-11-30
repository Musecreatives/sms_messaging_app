// Model class for contact
class ContactInfo {
  final String id;
  final String name;
  final String phoneNumber;
  bool isSelected;

  ContactInfo({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.isSelected = false,
  });
}
