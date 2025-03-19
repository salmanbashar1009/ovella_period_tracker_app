import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/Forum_screen/details_screen/mensrualHealth.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/CategoryCard1.dart';
import 'package:ovella_period_tracker_app/model/catagoryModel.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/categoryList.dart';

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
      height: size ?? MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: scrollDirection ?? Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
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
          );
        },
      ),
    );
  }
}
