import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

class EditMonthPicker extends StatefulWidget {
  EditMonthPicker({Key? key}) : super(key: key);

  @override
  State<EditMonthPicker> createState() => _EditMonthPickerState();
}

class _EditMonthPickerState extends State<EditMonthPicker> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  void initState() {
    // TODO: implement initState
    // Set initial position when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToItem(DateTime.now().month - 1);
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

    // // Set initial position when the widget is built
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _controller.jumpToItem(trackingScreenProvider.month - 1);
    // });

    return ListWheelScrollView.useDelegate(
      controller: _controller,
      itemExtent: 50,
      perspective: 0.005,
      diameterRatio: 1.5,
      overAndUnderCenterOpacity: 0.5,
      physics: FixedExtentScrollPhysics(),
      clipBehavior: Clip.antiAlias,
      onSelectedItemChanged: (index) {
        trackingScreenProvider.setMonth(index + 1);
      },
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: trackingScreenProvider.monthList.length,
        builder: (context, index) {
          return Center(
            child: Text(
              "${trackingScreenProvider.monthList[index]}",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color:
                    index + 1 == trackingScreenProvider.month
                        ? AppColors.secondary
                        : AppColors.textColor,
                fontSize: 24.sp,
                fontWeight:
                    index + 1 == trackingScreenProvider.month
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
