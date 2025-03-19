import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/images.dart';

class ChatInputField extends StatelessWidget{
  const ChatInputField({super.key});


  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff676364)
                    ),
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
    );
  }
}