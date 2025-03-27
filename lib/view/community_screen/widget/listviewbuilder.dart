import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/Forum_screen/details_screen/mensrualHealth.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/CategoryCard1.dart';
import 'package:ovella_period_tracker_app/model/catagoryModel.dart';

// ignore: must_be_immutable
class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  Axis? scrollDirection;
  double? size;
  double? val;
  double? right;
  CategoryList({
    Key? key,
    required this.categories,
    this.scrollDirection,
    this.size,
    this.val,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 250,
      child: ListView.builder(
       padding: scrollDirection != null ? EdgeInsets.only(bottom: 200.h) : null,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: scrollDirection ?? Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
         padding: scrollDirection == null ? EdgeInsets.only(left: 12.w) : EdgeInsets.zero,


            child: CategoryCard(
            
              val: val,
              right: right,
              imagePath: categories[index].imagePath,
              title: categories[index].title,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => MenstrualHealth(
                          categories: categories,
                          selectedIndex: index,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
