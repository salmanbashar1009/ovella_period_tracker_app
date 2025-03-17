import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class PeriodDateContainer extends StatelessWidget{
  const PeriodDateContainer({super.key});
  
  Widget _arrowButton({required bool isLeftButton, required GestureTapCallback onPressed}){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0XFF1E1E1E1F),
          ),
        ),
        child: isLeftButton ? Icon(Icons.arrow_back_ios_rounded,
        color: AppColors.iconColor,
        )
        :
        Icon(Icons.arrow_forward_ios_rounded,
          color: AppColors.iconColor,
        )
        ,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     // height: 496.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          /// Header of the Container
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _arrowButton(isLeftButton: true, onPressed: (){},),
              Text("Mar, 2025",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600
              ),),
              _arrowButton(isLeftButton: false, onPressed: (){},),
            ],
          ),

          SizedBox(height: 16.h,),

          Consumer<HomeScreenProvider>(
            builder: (_, homeScreenProvider, _) {
              return SizedBox(
                height: 75.h,
                child: ListView.builder(
                  itemCount: context.read<HomeScreenProvider>().daysInMonth.length,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    controller: context.read<HomeScreenProvider>().periodScrollController,
                    itemBuilder: (_, index){
                      DateTime date = homeScreenProvider.daysInMonth[index];
                      bool isToday = date.day == DateTime.now().day &&
                          date.month == DateTime.now().month &&
                          date.year == DateTime.now().year;

                    return Container(
                      padding: EdgeInsets.all(14.r),
                      margin: EdgeInsets.only(right: 12.w),
                      decoration: BoxDecoration(
                        color: isToday ? AppColors.secondary : Color(0xffF4F6F6),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          Text( DateFormat.E().format(date),

                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:  isToday ? AppColors.onSecondary : AppColors.lightTextColor,
                          ),),

                          Text(date.day.toString(),
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color:  isToday ? AppColors.onSecondary : AppColors.textColor,

                            ),),
                        ],
                      ),
                    );
                    }

                ),
              );
            }
          ),

          SizedBox(height: 20.h,),

          SizedBox(
            width: 220.w,
            height: 220.h,
            child: Stack(
              children: [


                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(33.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F4F6),
                      border: Border.all(
                        color: Color(0xffFDE7E7)
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Period",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.lightTextColor
                        ),),
                        Text("0 Day Left",
                        style: Theme.of(context).textTheme.headlineMedium,),

                        Text("Mar 3-Nest Period",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400
                          ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 220.w,
                  height: 220.h,
                  child: CircularProgressIndicator(
                    trackGap: 2,
                    strokeWidth: 10,
                    value: 0.3,
                    color: AppColors.secondary,
                    backgroundColor: Color(0xff25C871),

                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondary,
                ),
              ),
              SizedBox(width: 4,),
              Text("Period",
              style: Theme.of(context).textTheme.bodyMedium,),

              SizedBox(width: 12.w,),

              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff25C871),
                ),
              ),
              SizedBox(width: 4,),
              Text("Period",
                style: Theme.of(context).textTheme.bodyMedium,),

            ],
          ),


          SizedBox(height: 24.h,),

          Utils.primaryButton(
              title: "Log Period",
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 12.h),
              context: context,
              onTap: (){
                Navigator.pushNamed(context, RouteName.logPeriodScreen);
              },
            suffixIcon: Icon(Icons.add,color: AppColors.onPrimary,)
          )


        ],
      ),
    );
  }
}