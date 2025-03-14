import 'package:flutter/material.dart';

class CustomSegmentedControl extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelectionChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final double borderRadius;
  final double padding;

  const CustomSegmentedControl({
    Key? key,
    required this.options,
    required this.selectedIndex,
    required this.onSelectionChanged,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.transparent,
    this.borderRadius = 25.0,
    this.padding = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onSelectionChanged(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(vertical: padding, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? selectedColor : unselectedColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Text(
                options[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
