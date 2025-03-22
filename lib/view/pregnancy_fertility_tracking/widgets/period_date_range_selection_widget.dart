import 'package:flutter/material.dart';
import '../../../view_model/step_screen_provider.dart';

Future<void> selectDateRange(
    BuildContext context,
    StepScreenProvider stepScreenProvider,
    ) async {
  DateTime now = DateTime.now();
  DateTime startDate = stepScreenProvider.periodStartDate;
  DateTime endDate = stepScreenProvider.periodEndDate;

  DateTime firstDate = DateTime(now.year, now.month - 2, 1);

  DateTime lastDate = DateTime(now.year, now.month, now.day+6);

  final DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: firstDate,
    lastDate: lastDate,
    helpText: "Select Last Period",
    initialDateRange: endDate != DateTime.now()
        ? DateTimeRange(start: startDate, end: endDate)
        : null,
  );

  if (picked != null) {
    stepScreenProvider.setPeriodRangeDate(picked.start, picked.end);
    debugPrint("Start Date: ${picked.start.toString()}");
    debugPrint("End Date: ${picked.end.toString()}");
  }
}