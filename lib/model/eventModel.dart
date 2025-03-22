import 'package:ovella_period_tracker_app/model/healthCardModel.dart';

class Event {
  final String imagePath;
  final String title;
  final String date;
  final String location;
  final String discription;
  final List<Healthcardmodel> card;

  Event({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.location,
    required this.discription,
    required this.card,
  });
}
