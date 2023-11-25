import 'package:flutter/material.dart';

import '../core/app_export.dart';

class DraftsListTile extends StatelessWidget {
  final String title;
  final String content;
  final String time;
  final int maxContentLength; // Set a maximum character limit for content
  final VoidCallback onTapEdit;

  DraftsListTile({
    super.key,
    required this.title,
    required this.content,
    required this.time,
    this.maxContentLength = 50,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    String truncatedContent = content.length <= maxContentLength
        ? content
        : content.substring(0, maxContentLength) + '...';

    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            truncatedContent,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.edit,
        color: AppColor.primaryColor,
      ),
      onTap: () {
        onTapEdit(); // Pass the draft parameter
      },
    );
  }
}
