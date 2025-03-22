import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/widgets/screen_header.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
   AddNoteScreen({super.key});

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              children: [
                ScreenHeader(title: "Mar 3",onTap: (){Navigator.pop(context);},),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Note",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 17.sp),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0.h),
                            child: Icon(Icons.edit_calendar_outlined,color: AppColors.primary,),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: TextField(
                              controller: _textEditingController,
                              maxLines: null,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.lightTextColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400
                              ),
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: 'Write your note here...',
                                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.lightTextColor.withOpacity(0.5),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height:  24.h),
                SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: Consumer<TrackingScreenProvider>(
                      builder: (context,trackingScreenProvider,child) {
                        return Utils.primaryButton(title: "Save", context: context, onTap: (){
                          trackingScreenProvider.addNotes(noteText: _textEditingController.text);
                          Navigator.pop(context);
                        },);
                      }
                    ))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
