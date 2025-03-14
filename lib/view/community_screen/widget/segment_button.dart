import 'package:flutter/material.dart';

class CustomSegmentedControl extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelectionChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final double borderRadius;

  const CustomSegmentedControl({
    Key? key,
    required this.options,
    required this.selectedIndex,
    required this.onSelectionChanged,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.transparent,
    this.borderRadius = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes it take full width
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Even spacing for full width
        children: List.generate(options.length, (index) {
          bool isSelected = selectedIndex == index;
          return Expanded( // Ensures equal width for all segments
            child: GestureDetector(
              onTap: () => onSelectionChanged(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : unselectedColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                alignment: Alignment.center, // Centers text
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
  }
}
