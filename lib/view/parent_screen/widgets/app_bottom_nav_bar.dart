import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
            color: Color(0xFFFFDEE6),
            shape: BoxShape.circle
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.secondary,
          onPressed: (){},child: Text("AI"),
          shape: CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        elevation: 4,

        color: null,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_outlined, color: AppColors.secondary,),
                  Text("Home",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.pink
                  ),)
                ],
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_month_outlined, color: AppColors.secondary,),
                  Text("Home",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.pink
                  ),)
                ],
              ),
              onPressed: () {},
            ),
            SizedBox(width: 48), // Empty space for the FAB
            IconButton(
              padding: EdgeInsets.zero,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.supervisor_account_rounded, color: AppColors.secondary,),
                  Text("Home",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.pink
                  ),)
                ],
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings_outlined, color: AppColors.secondary,),
                  Text("Home",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.pink
                  ),)
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
