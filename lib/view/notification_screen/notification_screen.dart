import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/header_widget.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    // Sample data for the notifications
    List<Map<String, String>> notifications = [
      {
        'title': 'New Message Received',
        'description': 'You have a new message from your friend.',
      },
      {
        'title': 'Period Tracker Reminder',
        'description': 'Don\'t forget to log your cycle today.',
      },
      {
        'title': 'App Update Available',
        'description': 'A new version of the app is ready to install.',
      },
      {
        'title': 'Fertility Window Approaching',
        'description': 'Your fertility window starts tomorrow.',
      },
      {
        'title': 'New Message Received',
        'description': 'You have a new message from your friend.',
      },
      {
        'title': 'Period Tracker Reminder',
        'description': 'Don\'t forget to log your cycle today.',
      },
      {
        'title': 'App Update Available',
        'description': 'A new version of the app is ready to install.',
      },
      {
        'title': 'Fertility Window Approaching',
        'description': 'Your fertility window starts tomorrow.',
      },
      {
        'title': 'New Message Received',
        'description': 'You have a new message from your friend.',
      },
      {
        'title': 'Period Tracker Reminder',
        'description': 'Don\'t forget to log your cycle today.',
      },
      {
        'title': 'App Update Available',
        'description': 'A new version of the app is ready to install.',
      },
      {
        'title': 'Fertility Window Approaching',
        'description': 'Your fertility window starts tomorrow.',
      },
    ];

    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: AppPadding.screenHorizontalPadding,
          child: Column(
            children: [
              HeaderWidget(title: 'Notifications'),
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColors.onPrimary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20.r,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/black-man-posing_23-2148171684.jpg?semt=ais_hybrid',
                          ),
                        ),
                        title: Text(
                          notification['title'] ?? 'Notification Title',
                          style: textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          notification['description'] ??
                              'Notification description here.',
                          style: textTheme.bodySmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            _showNotificationOptions(context);
                          },
                          icon: Icon(Icons.more_horiz),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showNotificationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Mark as Read Option
              ListTile(
                leading: Icon(Icons.mark_email_read),
                title: Text('Mark as Read'),
                onTap: () {
                  Navigator.pop(context);  // Close the bottom sheet
                },
              ),
              // Mark as Unread Option
              ListTile(
                leading: Icon(Icons.mark_email_unread),
                title: Text('Mark as Unread'),
                onTap: () {
                  Navigator.pop(context);  // Close the bottom sheet
                },
              ),
              // Delete Option
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  // Implement action for deleting the notification
                  Navigator.pop(context);  // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
