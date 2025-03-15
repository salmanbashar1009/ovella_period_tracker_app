import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/constant/images.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/inputDecoration.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/CategoryCard1.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/segment_button.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body:
      
      //  Stack(

        // children:[ 
          
        //  Positioned.fill(
        //     child: Image.asset(
        //       filterQuality: FilterQuality.high,
        //      AppImages.screenBackground,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
          BackgroundWidget(
            child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  children: [
                    SizedBox(height: 22.h,),
                //---------appbar section ------------------------------------
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
            
                        ClipOval(child: Image.asset("assets/images/black3.jpeg",
                        height: 48.h,
                        width: 48.w,
                        )),
                        Spacer(),
                         Center(child: Text("Community",
                         style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                         fontSize: 19.sp,
                         fontWeight: FontWeight.w500,
                         color: Color(0xff1E1E1E)
                         ))),
                        Spacer(),
                       Utils.circleContainer(icon: Icon(Icons.notifications_none_outlined))
                         
                         ]),
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
                          ),)), 
                          SizedBox(height: 8.h,),
              //-------------sub sub title ---------------------------------------------
                 Align(
                          alignment: Alignment.center,
                          child: Text("Join discussions,ask question, and",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor
                          ),)),    
                            Align(
                          alignment: Alignment.center,
                          child: Text("connect with experts!",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor
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
                       ),
                       SizedBox(height: 24.h,),
              //-----------catagory section----------------------------------------------
              Row(children:[
                       Text("Menstrual Health",
                       style: Theme.of(context).textTheme.bodyLarge,
                      ),
                        Spacer(),
            
            //-------------See all -----------------------------------------------------
                       GestureDetector(
                        onTap: () {},
                        child: Text("See all"),
                        
                        )]),
                        SizedBox(height: 16.h,),
            //-------------List-view-builder---------------------------------------------
              SizedBox(
              height: 270.h, // Define a height to avoid layout issues
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
            return CategoryCard(
              imagePath: "assets/images/black1.jpg",
              title: "How much period blood is normal",
              onTap: () {},
            );
                },
              ),
            ),
            SizedBox(height: 24.h,),
              //--------------------------------fertility- listview - builder---------------------
                  Row(children:[
                       Text("Fertility",
                       style: Theme.of(context).textTheme.bodyLarge,
                      ),
                        Spacer(),
            
            //-------------See all -----------------------------------------------------
                       GestureDetector(
                        onTap: () {},
                        child: Text("See all"),
                        
                        )]),
                        SizedBox(height: 16.h,),
            //-------------Fertility List-view-builder---------------------------------------------
              SizedBox(
              height: 270.h, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
            return CategoryCard(
              imagePath: "assets/images/black2.jpeg",
              title: "How much period blood is normal",
              onTap: () {},
            );
                },
              ),
            ),
            SizedBox(height: 24.h,),
                    
            //-------------------sex - listviewBuilder-----------------------------------
                    
                  Row(children:[
                       Text("Sexual Health",
                       style: Theme.of(context).textTheme.bodyLarge,
                      ),
                        Spacer(),
            
            //-------------See all -----------------------------------------------------
                       GestureDetector(
                        onTap: () {},
                        child: Text("See all"),
                        
                        )]),
                        SizedBox(height: 16.h,),
            //-------------Fertility List-view-builder---------------------------------------------
              SizedBox(
              height: 270.h, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
            return CategoryCard(
              imagePath: "assets/images/black3.jpeg",
              title: "How much period blood is normal",
              onTap: () {},
            );
                },
              ),
            ),
            SizedBox(height: 24.h,),
                    
                  ],
                ),
              ),
            ),
                    ),
          ),
    //  ]
     
    //  ),
    );
  }
}
