import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

class EditYearPicker extends StatefulWidget {
  const EditYearPicker({super.key});

  @override
  State<EditYearPicker> createState() => _EditYearPickerState();
}

class _EditYearPickerState extends State<EditYearPicker> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  void initState() {
    // TODO: implement initState
    // Set initial position when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToItem(DateTime.now().year - 1951);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trackingScreenProvider = Provider.of<TrackingScreenProvider>(context);

    return ListWheelScrollView.useDelegate(
      controller: _controller,
      itemExtent: 50,
      perspective: 0.005,
      diameterRatio: 1.5,
      overAndUnderCenterOpacity: 0.5,
      physics: FixedExtentScrollPhysics(),
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