import 'dart:convert';

class PeriodInformationModel {
  List<DateTime> nextPeriodDates;
  DateTime lastPeriodDate;
  int cycleLength;
  String pregnancyStatus;
  String healthConditions;

  // Constructor
  PeriodInformationModel({
    required this.nextPeriodDates,
    required this.lastPeriodDate,
    required this.cycleLength,
    required this.pregnancyStatus,
    required this.healthConditions,
  });

  // Convert a PeriodCycle object to a map (for JSON serialization)
  Map<String, dynamic> toMap() {
    return {
      'nextPeriodDates': nextPeriodDates.map((e) => e.toIso8601String()).toList(),
      'lastPeriodDate': lastPeriodDate.toIso8601String(),
      'cycleLength': cycleLength,
      'pregnancyStatus': pregnancyStatus,
      'healthConditions': healthConditions,
    };
  }

  // Create a PeriodCycle object from a map (for JSON deserialization)
  factory PeriodInformationModel.fromMap(Map<String, dynamic> map) {
    return PeriodInformationModel(
      nextPeriodDates: List<DateTime>.from(
        map['nextPeriodDates'].map((x) => DateTime.parse(x)),
      ),
      lastPeriodDate: DateTime.parse(map['lastPeriodDate']),
      cycleLength: map['cycleLength'],
      pregnancyStatus: map['pregnancyStatus'],
      healthConditions: map['healthConditions'],
    );
  }

  // Optional: Convert the object to a JSON string (for easier transmission or storage)
  String toJson() => json.encode(toMap());

  // Optional: Create a PeriodCycle from a JSON string
  factory PeriodInformationModel.fromJson(String source) =>
      PeriodInformationModel.fromMap(json.decode(source));
}
