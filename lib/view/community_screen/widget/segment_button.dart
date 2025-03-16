import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view_model/community_provider.dart';
import 'package:provider/provider.dart';

class CustomSegmentedControl extends StatelessWidget {
  final List<String> options;
  final Color selectedColor;
  final Color unselectedColor;
  final double borderRadius;

  const CustomSegmentedControl({
    Key? key,
    required this.options,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.transparent,
    this.borderRadius = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, provider, child) {
        return Container(
          width: double.infinity, // Full width
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 5),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(options.length, (index) {
              bool isSelected = provider.selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => provider.updateSelectedIndex(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 80),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: isSelected ? selectedColor : unselectedColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      options[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
