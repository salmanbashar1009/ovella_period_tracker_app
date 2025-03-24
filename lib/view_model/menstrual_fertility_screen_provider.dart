import 'package:flutter/cupertino.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';

class MenstrualFertilityScreenProvider extends ChangeNotifier {
  final TrackingScreenProvider trackingScreenProvider;
  late final DateTime _periodStartDate;

  MenstrualFertilityScreenProvider({required this.trackingScreenProvider}) {
    if (trackingScreenProvider.periodDates.isNotEmpty) {
      _periodStartDate = trackingScreenProvider.periodDates.first;
      notifyListeners();

    } else {
      // Provide fallback, e.g., today's date
      _periodStartDate = DateTime.now();
      notifyListeners();
    }
    trackingScreenProvider.ovulationDates.add(getOvulationDate());
    trackingScreenProvider.getDayColor(getOvulationDate().day);

  }

  DateTime get periodStartDate => _periodStartDate;

  DateTime getOvulationDate() {
    return _periodStartDate.add(const Duration(days: 14));
  }

  List<DateTime> getFertileDates() {
    DateTime ovulationDate = getOvulationDate();
    List<DateTime> fertileDates = [];
    for (int i = 5; i >= 0; i--) {
      fertileDates.add(ovulationDate.subtract(Duration(days: i)));
    }
    return fertileDates;
  }
}