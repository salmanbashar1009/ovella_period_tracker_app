import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:provider/provider.dart';
import '../../../view_model/chat_screen_provider.dart';

class NewChat extends StatelessWidget {
  const NewChat({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<ChatScreenProvider>(
      builder: (_, chatScreenProvider, __) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          curve: Curves.easeInOut,
          width:
              chatScreenProvider.isOpenNewChatField
                  ? 220.w
                  : 155.w, // Width changes
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(60.r),
          ),
          alignment: Alignment.center,
          child:
              chatScreenProvider.isOpenNewChatField
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: chatScreenProvider.newChatNameController,
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.onPrimary,
                          ),
                          cursorColor: AppColors.onPrimary,
                          decoration: InputDecoration(
                            filled: false,
                            hintText: 'New chat name',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      IconButton(
                        onPressed: () {
                          if (chatScreenProvider
                              .newChatNameController
                              .text
                              .isEmpty) {
                            chatScreenProvider.toggleNewChatField(false);
                          } else {
                            chatScreenProvider.onNewChat();
                            chatScreenProvider.toggleNewChatField(false);
                            chatScreenProvider.newChatNameController.clear();
                          }
                        },
                        icon: Icon(
                          CupertinoIcons.check_mark_circled,
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ],
                  )
                  : GestureDetector(
                    onTap: () {
                      chatScreenProvider.toggleNewChatField(true);
                    },
                    child: SizedBox(
                      child: Row(
                        spacing: 6.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'New Chat',
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Icon(Icons.add, color: AppColors.onPrimary),
                        ],
                      ),
                    ),
                  ),
        );
      },
    );
  }
}
