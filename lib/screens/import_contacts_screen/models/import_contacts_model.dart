import '../../../core/app_export.dart';

// Model class for contact
class Contact {
  final String id;
  final String name;
  final String phoneNumber;
  bool isSelected;

  Contact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.isSelected = false,
  });
}
