import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/ai_chat/widgets/chat_input_field.dart';
import 'package:ovella_period_tracker_app/view_model/chat_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: AppPadding.screenHorizontalPadding,
        child: Stack(
          children: [
            Column(
              children: [
                /// Appbar
                AppBar(
                  centerTitle: true,
                  surfaceTintColor: Colors.transparent,
                  actions: [
                    Utils.circleContainer(imagePath: AppImages.dotMenuIcon),
                  ],
                  title: Utils.primaryButton(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    title: "New Chat",
                    onTap: () {
                      context.read<ChatScreenProvider>().onNewChat();
                    },
                    context: context,
                    suffixIcon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20.r,
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: AppPadding.screenVerticalPadding,
                    child: Consumer<ChatScreenProvider>(
                      builder: (_, chatProvider, _) {
                        return SingleChildScrollView(
                          controller: chatProvider.chatScrollController,
                          reverse: chatProvider.chat.chat == null ? false :  true,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hello, Jane Doe",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "How can i assist you today?",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.lightTextColor),
                              ),

                              SizedBox(height: 24.h),

                              Utils.primaryButton(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                color: chatProvider.isDefaultQuestion1Pressed ? null : Colors.white,
                                title: chatProvider.defaultQuestionList[0],
                                onTap: () {
                                  chatProvider.onDefaultQuestionPressed(1);

                                  chatProvider.chatController.text = chatProvider.defaultQuestionList[0];
                                  chatProvider.sendCommand();
                                },
                                context: context,
                                textStyle: chatProvider.isDefaultQuestion1Pressed ? null : Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.textColor),
                              ),

                              Utils.primaryButton(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                title: chatProvider.defaultQuestionList[1],
                                onTap: () {
                                  chatProvider.onDefaultQuestionPressed(2);
                                  chatProvider.chatController.text = chatProvider.defaultQuestionList[1];
                                chatProvider.sendCommand();},
                                context: context,
                                color:  chatProvider.isDefaultQuestion2Pressed ? null : Colors.white,
                                textStyle:  chatProvider.isDefaultQuestion2Pressed ? null : Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.textColor),
                              ),

                              SizedBox(height: 20.h),

                              if (chatProvider.chat.chat != null)
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: chatProvider.chat.chat?.length,
                                  itemBuilder: (_, index) {
                                    final String question =
                                        chatProvider.chat.chat![index].command!;
                                    final String reply =
                                        chatProvider.chat.chat![index].reply!;
                                    return Padding(
                                      padding:  EdgeInsets.only(bottom : 18.0),
                                      child: Column(
                                        spacing: 14.h,
                                        children: [
                                          // User command
                                          Row(
                                            spacing: 12.w,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                fit: FlexFit.loose,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(24.r)

                                                  ),
                                                  child: Column(
                                                    spacing: 12.h,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      SelectableText(
                                                        question,
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                      ),
                                                      GestureDetector(
                                                        onTap:()=> context.read<ChatScreenProvider>().onEdit(text: question),
                                                        child: Image.asset(
                                                          AppImages.editIcon,
                                                          width: 20.w,
                                                          height: 20.h,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                child: Image.asset(
                                                  AppImages.userProfilePicture,
                                                  width: 44.w,
                                                  height: 44.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),

                                          /// AI reply
                                          Row(
                                            spacing: 12.w,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                  AppImages.gptProfilePicture,
                                                  width: 44.w,
                                                  height: 44.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(24.r),),
                                                  child: Column(
                                                    spacing: 12.h,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      DefaultTextStyle(
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium!,
                                                          child: AnimatedTextKit(
                                                            repeatForever: false,
                                                              totalRepeatCount: 1,
                                                              animatedTexts:[
                                                                TyperAnimatedText(reply,speed: const Duration(milliseconds: 40),
                                                                )
                                                              ],
                                                          ),
                                                      ),
                                                      // Text(
                                                      //   reply,
                                                      //   style:
                                                      //       Theme.of(context)
                                                      //           .textTheme
                                                      //           .bodyMedium,
                                                      // ),
                                                      Row(
                                                        spacing: 12.w,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          GestureDetector(
                                                            onTap:()=> context.read<ChatScreenProvider>().onEdit(text: reply),
                                                            child: Image.asset(
                                                              AppImages.replyIcon,
                                                              width: 20.w,
                                                              height: 20.h,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap:
                                                                () =>
                                                                    Utils.copyText(
                                                                      text: reply,
                                                                    ),
                                                            child: Image.asset(
                                                              AppImages.copyIcon,
                                                              width: 20.w,
                                                              height: 20.h,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),

                              SizedBox(height: 120.h),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            ChatInputField(),
          ],
        ),
      ),
    );
  }
}
