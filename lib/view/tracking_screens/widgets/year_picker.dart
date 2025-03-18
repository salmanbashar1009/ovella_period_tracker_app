import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

class EditYearPicker extends StatelessWidget {
  EditYearPicker({Key? key}) : super(key: key);

  final FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    final trackingScreenProvider = Provider.of<TrackingScreenProvider>(context);

    // Set initial position when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToItem(trackingScreenProvider.year - 1951);
    });

    return ListWheelScrollView.useDelegate(
      controller: _controller,
      itemExtent: 50,
      perspective: 0.005,
      diameterRatio: 1.5,
      physics: const FixedExtentScrollPhysics(),
      dragStartBehavior: DragStartBehavior.down,
      onSelectedItemChanged: (index) {
        trackingScreenProvider.setYear(1951 + index); // Start from year 2000
      },
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: 100, // 100 years starting from 1950
        builder: (context, index) {
          final year = 1951 + index;
          return Center(
            child: Text(
              year.toString(),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: year == trackingScreenProvider.year ? AppColors.secondary : AppColors.textColor,
              fontSize: 24.sp,
              fontWeight: year == trackingScreenProvider.year
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
            ),
          );
        },
      ),
    );
  }
}