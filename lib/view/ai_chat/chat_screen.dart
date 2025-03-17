import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class ChatScreen extends StatelessWidget{
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
                  AppBar(
                    centerTitle: true,
                    actions: [
                      Utils.circleContainer(
                        imagePath: AppImages.dotMenuIcon
                      ),
                    ],
                    title: Utils.primaryButton(
                      padding: EdgeInsets.symmetric(horizontal:  24.w),
                        title: "New Chat",
                        onTap: (){},
                        context: context,
                      suffixIcon: Icon(Icons.add,color: Colors.white,
                      size: 20.r,)
                    ),
                  ),
                  Column(
                    children: [

                    ],
                  )
                ],
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 150.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(150.r),
                        ),
                        child: TextFormField(
                          onTapOutside: (_){
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            border: InputBorder.none,
                            fillColor: Colors.transparent,
                            hintText: "Type your question",
                            suffixIcon: GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                  color: Color(0xffF4F6F6),
                                  shape: BoxShape.circle
                                ),
                                child: Image.asset(AppImages.sendIcon,
                                width: 16.w,
                                height: 16.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ),
                        ),

                      ),
                    ),
                    SizedBox(width: 12.w,),
                    GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(14.r),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child : Image.asset(AppImages.microphone,
                            width: 24.w,
                              height: 24.h,
                              fit: BoxFit.cover,
                            )
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}