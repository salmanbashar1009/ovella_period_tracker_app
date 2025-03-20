import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import '../../../../constant/images.dart';
class PersonalInformationEditCard extends StatelessWidget {
  const PersonalInformationEditCard({super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Personal Information', style: textTheme.bodyLarge),
              GestureDetector(
                onTap: (){
                 Navigator.pushNamed(context, RouteName.personalInformationSettingScreen);
                },
                  child: Image.asset(AppImages.editPencil)),
            ],
          ),
          SizedBox(height: 10.h,),
          Divider(color: Color(0xff1E1E1E).withOpacity(0.12)),
          _buildDetails(
            textTheme: textTheme,
            title: 'Age',
            value: '28 Years Old',
          ),
          _buildDetails(textTheme: textTheme, title: 'Gender', value: 'Female'),
        ],
      ),
    );
  }

  Widget _buildDetails({
    required TextTheme textTheme,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.bodyMedium),
          Text(value, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}