import 'package:ovella_period_tracker_app/model/health_card_model.dart';

class Event {
  final String imagePath;
  final String title;
  final String date;
  final String location;
  final String discription;
  final List<HealthCardModel> card;

  Event({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.location,
    required this.discription,
    required this.card,
  });
}
