import '../../core/app_export.dart';
import 'controller/import_contacts_controller.dart';

class ImportContactsScreen extends StatelessWidget {
  final ImportContactsController controller =
      Get.put(ImportContactsController());

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.whiteColor,
        title: Text(
          'Imported Contacts',
          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: controller.contacts.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  itemBuilder: (context, index) {
                    final contact = controller.contacts[index];
                    if ((!controller.showPaidUsers.value && contact.isPaid) ||
                        (!controller.showUnpaidUsers.value &&
                            !contact.isPaid)) {
                      return SizedBox.shrink();
                    }
                    return Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(70),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(getProportionateScreenWidth(5)),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          contact.name,
                          style: AppTheme.lightTheme.textTheme.bodyMedium!
                              .copyWith(
                            color: AppColor.whiteColor,
                          ),
                        ),
                        subtitle: Text(
                          'Phone number: ${contact.phoneNumber}',
                          style: AppTheme.lightTheme.textTheme.bodyMedium!
                              .copyWith(
                            color: AppColor.whiteColor,
                          ),
                        ),
                        trailing: Container(
                          width: getProportionateScreenHeight(25),
                          height: getProportionateScreenHeight(25),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.whiteColor,
                          ),
                          child: Icon(
                            contact.isSelected ? Icons.add : Icons.check,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        onTap: () {
                          // Toggle the selection status on tap
                          controller.toggleContactSelection(index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 110,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.showAllUsers.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.toggleAllUsers(value);
                        }
                      },
                    ),
                  ),
                  Text(
                    'All Users',
                    style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.showPaidUsers.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.togglePaidUsers(value);
                        }
                      },
                    ),
                  ),
                  Text(
                    'Paid Users',
                    style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.showUnpaidUsers.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.toggleUnpaidUsers(value);
                        }
                      },
                    ),
                  ),
                  Text(
                    'Unpaid Users',
                    style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  // Implement logic to send messages 
                    controller.sendMessageToSelectedContacts;
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor,
                  ),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// bottom dialog

