import 'package:flutter/cupertino.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';

class MenstrualFertilityScreenProvider extends ChangeNotifier {
  final TrackingScreenProvider trackingScreenProvider;
  late final DateTime _periodStartDate;

  MenstrualFertilityScreenProvider({required this.trackingScreenProvider}) {
    if (trackingScreenProvider.periodDates.isNotEmpty) {
      _periodStartDate = trackingScreenProvider.periodDates.first;
      getNextPeriodDate();
      getFertileDates();
      notifyListeners();

    } else {
      // Provide fallback, e.g., today's date
      _periodStartDate = DateTime.now();
      notifyListeners();
    }
    trackingScreenProvider.ovulationDates.add(getOvulationDate());
    trackingScreenProvider.fertileDates.addAll(getFertileDates());
    trackingScreenProvider.nextPeriodDates.add(getNextPeriodDate());
    // trackingScreenProvider.getDayColor(getOvulationDate().day);

  }

  DateTime get periodStartDate => _periodStartDate;

  DateTime getOvulationDate() {
    final ovulationDate =_periodStartDate.add(const Duration(days: 14));
    debugPrint("ovulation date : $ovulationDate");
    return ovulationDate;
  }

  DateTime getNextPeriodDate(){
    final nextPeriodDate = _periodStartDate.add(const Duration(days: 28));
    debugPrint("next period date : $nextPeriodDate");
    return nextPeriodDate;
  }

  List<DateTime> getFertileDates() {
    DateTime ovulationDate = getOvulationDate();
    List<DateTime> fertileDates = [];
    for (int i = 5; i >= 0; i--) {
      fertileDates.add((ovulationDate).subtract(Duration(days: i)));
    }
    fertileDates.removeAt(5);
    debugPrint("fertile dates : $fertileDates");
    return fertileDates;
  }
}