import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/model/catagory_model.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/category_list.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/listviewbuilder.dart';
import '../../../../l10n/app_localizations.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final appLocalization = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySection(
            title: appLocalization!.menstrualhealth,
            categories: categories1,
            routeName: RouteName.menstralScreen,
          ),
          CategorySection(
            title:appLocalization.fertility,
            categories: categories2,
            routeName: RouteName.fertilityScreen,
          ),
          CategorySection(
            title:appLocalization.sexualhealth,
            categories: categories3,
            routeName: RouteName.sexualScreen,
          ),
        ],
      ),
    );
  }
}

//------------Category Section Widget--------------
class CategorySection extends StatelessWidget {
  final String title;
  final List<CategoryModel> categories;
  final String routeName;
  final TextStyle? textTheme;
  const CategorySection({super.key,
    required this.title,
    required this.categories,
    required this.routeName,
    this.textTheme
  });

  @override
  Widget build(BuildContext context) {
            final appLocalization = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
                      padding: AppPadding.screenHorizontalPadding,

          child: Row(
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge),
              Spacer(),
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, routeName)},
                child: Text(
                appLocalization!.seeall,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 270.h,
          child: CategoryList(right: 12.w, categories: categories),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
