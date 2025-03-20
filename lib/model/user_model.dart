class UserModel {
  final String fullName;
  final String email;
  final String userId;
  final String phoneNumber;
  final String password;
  final String gender;
  final String profileImageUrl;
  final bool unlockPremiumFeatures;
  final int age;
  final String preferredLanguage;
  final bool isRegularCycle;
  final bool isCurrentlyPregnant;
  final bool haveExperienceOfIrregularPeriod;
  String? healthConditions;
  final bool periodAndOvulationReminder;
  final bool mentalHealthReminder;
  final bool whatsappUpdateForTips;
  final String diagnosedWithFibroids;
  final String diagnosedWithFPCOS;
  final String haveAHistoryOfEndometriosis;
  final String haveAFamilyHistoryOfFibroids;
  final String activelyTryingToConceive;
  final String experiencedPregnancyLoss;
  final String historyOfHighBloodPressure;
  final String diagnosedWithFertilityConditions;
  final int cycleLength;
  final DateTime lastPeriod;

  UserModel({
    required this.fullName,
    required this.email,
    required this.userId,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.profileImageUrl,
    required this.unlockPremiumFeatures,
    required this.age,
    required this.preferredLanguage,
    required this.isRegularCycle,
    required this.isCurrentlyPregnant,
    required this.haveExperienceOfIrregularPeriod,
    this.healthConditions,
    required this.periodAndOvulationReminder,
    required this.mentalHealthReminder,
    required this.whatsappUpdateForTips,
    this.diagnosedWithFibroids = "No",
    this.diagnosedWithFPCOS = "No",
    this.haveAHistoryOfEndometriosis = "No",
    this.haveAFamilyHistoryOfFibroids = "No",
    this.activelyTryingToConceive = "No",
    this.experiencedPregnancyLoss = "No",
    this.historyOfHighBloodPressure = "No",
    this.diagnosedWithFertilityConditions = "No",
    required this.cycleLength, // Added cycle length
    required this.lastPeriod, // Added last period date
  });

  /// Convert UserModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "userId": userId,
      "phoneNumber": phoneNumber,
      "password": password,
      "gender": gender,
      "profileImageUrl": profileImageUrl,
      "unlockPremiumFeatures": unlockPremiumFeatures,
      "age": age,
      "preferredLanguage": preferredLanguage,
      "isRegularCycle": isRegularCycle,
      "isCurrentlyPregnant": isCurrentlyPregnant,
      "haveExperienceOfIrregularPeriod": haveExperienceOfIrregularPeriod,
      "healthConditions": healthConditions,
      "periodAndOvulationReminder": periodAndOvulationReminder,
      "mentalHealthReminder": mentalHealthReminder,
      "whatsappUpdateForTips": whatsappUpdateForTips,
      "diagnosedWithFibroids": diagnosedWithFibroids,
      "diagnosedWithFPCOS": diagnosedWithFPCOS,
      "haveAHistoryOfEndometriosis": haveAHistoryOfEndometriosis,
      "haveAFamilyHistoryOfFibroids": haveAFamilyHistoryOfFibroids,
      "activelyTryingToConceive": activelyTryingToConceive,
      "experiencedPregnancyLoss": experiencedPregnancyLoss,
      "historyOfHighBloodPressure": historyOfHighBloodPressure,
      "diagnosedWithFertilityConditions": diagnosedWithFertilityConditions,
      "cycleLength": cycleLength,
      "lastPeriod": lastPeriod.toIso8601String(), // Convert DateTime to String for JSON
    };
  }

  /// Create UserModel object from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json["fullName"],
      email: json["email"],
      userId: json["userId"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
      gender: json["gender"],
      profileImageUrl: json["profileImageUrl"],
      unlockPremiumFeatures: json["unlockPremiumFeatures"],
      age: json["age"],
      preferredLanguage: json["preferredLanguage"],
      isRegularCycle: json["isRegularCycle"],
      isCurrentlyPregnant: json["isCurrentlyPregnant"],
      haveExperienceOfIrregularPeriod: json["haveExperienceOfIrregularPeriod"],
      healthConditions: json["healthConditions"],
      periodAndOvulationReminder: json["periodAndOvulationReminder"],
      mentalHealthReminder: json["mentalHealthReminder"],
      whatsappUpdateForTips: json["whatsappUpdateForTips"],
      diagnosedWithFibroids: json["diagnosedWithFibroids"] ?? "No",
      diagnosedWithFPCOS: json["diagnosedWithFPCOS"] ?? "No",
      haveAHistoryOfEndometriosis: json["haveAHistoryOfEndometriosis"] ?? "No",
      haveAFamilyHistoryOfFibroids: json["haveAFamilyHistoryOfFibroids"] ?? "No",
      activelyTryingToConceive: json["activelyTryingToConceive"] ?? "No",
      experiencedPregnancyLoss: json["experiencedPregnancyLoss"] ?? "No",
      historyOfHighBloodPressure: json["historyOfHighBloodPressure"] ?? "No",
      diagnosedWithFertilityConditions: json["diagnosedWithFertilityConditions"] ?? "No",
      cycleLength: json["cycleLength"],
      lastPeriod: DateTime.parse(json["lastPeriod"]), // Convert String to DateTime
    );
  }
}
