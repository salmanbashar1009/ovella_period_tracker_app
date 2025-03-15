import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/CategoryCard1.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories;

  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust height based on your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            imagePath: categories[index]['imagePath']!,
            title: categories[index]['title']!,
            onTap: () {}, // Add your onTap functionality here
          );
        },
      ),
    );
  }
}
