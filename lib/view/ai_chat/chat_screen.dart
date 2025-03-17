import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Padding(
          padding: AppPadding.screenHorizontalPadding,
          child: Column(
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
              )
            ],
          ),
        )
    );
  }
}