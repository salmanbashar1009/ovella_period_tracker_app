import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/model/chat_model.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view_model/chat_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../../constant/images.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    debugPrint("\ndevice height : $deviceHeight\n");

    return Consumer<ChatScreenProvider>(
      builder: (_, chatProvider, _) {
        return KeyboardVisibilityBuilder(
          builder: (_, bool isOpenKeyBoard) {
            return Positioned(
              left: 0,
              right: 0,
              bottom: isOpenKeyBoard ? 10 : deviceHeight < 660 ? 140 :  150,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: Offset(0, 8),
                            blurRadius: 7.r,
                            spreadRadius: 7.r,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150.r),
                      ),
                      child: TextFormField(
                        controller:
                            context.read<ChatScreenProvider>().chatController,
                        onTap: () {
                          chatProvider.onCheckKeyboardOpenedOrNot(context);
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                          hintText: "Type your question",
                          hintStyle: Theme.of(
                            context,
                          ).inputDecorationTheme.hintStyle?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff676364),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              context.read<ChatScreenProvider>().sendCommand();
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.r),
                              decoration: BoxDecoration(
                                color: Color(0xffF4F6F6),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                AppImages.sendIcon,
                                width: 16.w,
                                height: 16.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: ()async{
                      chatProvider.isListening
                          ? chatProvider.stopListening()
                          : chatProvider.startListening();
                      debugPrint(chatProvider.isListening.toString());
                      debugPrint(chatProvider.isListening.toString());
                    },
                    child: Container(
                      padding: EdgeInsets.all(14.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: chatProvider.isListening?AppColors.secondary:Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: Offset(0, 8),
                            blurRadius: 7.r,
                            spreadRadius: 7.r,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        AppImages.microphone,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
