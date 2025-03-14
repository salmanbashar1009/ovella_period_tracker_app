import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/inputDecoration.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/segment_button.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              SizedBox(height: 22.h,),
    //---------appbar section ------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Center(child: Text("Community",
                   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                   fontSize: 19.sp,
                   fontWeight: FontWeight.w500,
                   color: Color(0xff1E1E1E)
                   )))]),
              SizedBox(height:21.5.sp ,),
    //---------Sub title section----------------------------------
                   Align(
                    alignment: Alignment.center,
                    child: Text("Hey jane Doe, Welcome to the",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1E1E1E)
                    ),)),    
                      Align(
                    alignment: Alignment.center,
                    child: Text("Ovella community",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1E1E1E)
                    ),)), 
                    SizedBox(height: 8.h,),
  //-------------sub sub title ---------------------------------------------
           Align(
                    alignment: Alignment.center,
                    child: Text("Join discussions,ask question, and",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff676364)
                    ),)),    
                      Align(
                    alignment: Alignment.center,
                    child: Text("connect with experts!",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff676364)
                    ),)), 
                    SizedBox(height: 28.h,),

                    CustomSegmentedControl(
                      options: ["Forum","Groups","Events"], 
                      selectedIndex: 0,
                       onSelectionChanged: (value){}),
                       SizedBox(height: 16.h,),

        //-----------search-------------------------------------------------------
                 TextFormField(
                 decoration: inputDecoration(context,"Finds topics, groups and discussions",null,Icon(Icons.search),120.0)
                 )

            ],
          ),
        ),
      ),
    );
  }
}
