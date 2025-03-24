import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utility/utils.dart';
import '../../../view_model/chat_screen_provider.dart';

class NewChat extends StatelessWidget {
  const NewChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Utils.primaryButton(
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
    );
  }
}
