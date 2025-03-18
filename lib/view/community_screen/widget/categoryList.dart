import 'package:ovella_period_tracker_app/model/catagoryModel.dart';
import 'package:ovella_period_tracker_app/model/eventModel.dart';
import 'package:ovella_period_tracker_app/model/groupModel.dart';

List<CategoryModel> categories1 = [
  CategoryModel(
    imagePath: "assets/images/community/blood.png",
    title: "How much period blood is normal",
  ),
  CategoryModel(
    imagePath: "assets/images/community/pad.png",
    title: "What does my period blood color mean?",
  ),
  CategoryModel(
    imagePath: "assets/images/community/undy.png",
    title: "What is free bleeding?",
  ),
  CategoryModel(
    imagePath: "assets/images/community/blacksis1.png",
    title: "How to reduce and prevent period bloating",
  ),
  CategoryModel(
    imagePath: "assets/images/community/clockpad.png",
    title: "How did menstruation become taboo",
  ),
];

List<CategoryModel> categories2 = [
  CategoryModel(
    imagePath: "assets/images/community/blackcartoon.png",
    title: "How old is too old to have a baby?",
  ),
  CategoryModel(
    imagePath: "assets/images/community/calender.png",
    title: "Understanding period cramps",
  ),
  CategoryModel(
    imagePath: "assets/images/community/blacksis2.png",
    title: "Hair changes during pregnancy",
  ),
  CategoryModel(
    imagePath: "assets/images/community/kit.png",
    title: "PCOS and pregnancy",
  ),
  CategoryModel(
    imagePath: "assets/images/community/baby.png",
    title: "How is basal body temperature (BBT) used",
  ),
];

List<CategoryModel> categories3 = [
  CategoryModel(
    imagePath: "assets/images/community/pussy.png",
    title: "How many types of female orgasms are there",
  ),
  CategoryModel(
    imagePath: "assets/images/community/blacksis.png",
    title: "5 things to know about your sex drive",
  ),
  CategoryModel(
    imagePath: "assets/images/community/condom.png",
    title: "Safer sex 101",
  ),
  CategoryModel(
    imagePath: "assets/images/community/cherry.png",
    title: "Chlamydia 101",
  ),
  CategoryModel(
    imagePath: "assets/images/community/pocketcondom.png",
    title: "Condom use from a female perspective",
  ),
];

List<GroupModel> group1 = [
  GroupModel(
    name: "PCOS & Endometriosis Support",

    memberImages: [
      "assets/images/person/p1.png",
      "assets/images/person/p2.png",
      "assets/images/person/p3.png",
      "assets/images/person/pall.png",
    ],
  ),

  GroupModel(
    name: "Pregnancy Wellness Tips",

    memberImages: [
      "assets/images/person/p4.png",
      "assets/images/person/p5.png",
      "assets/images/person/p6.png",
      "assets/images/person/pall2.png",
    ],
  ),

  GroupModel(
    name: "Mindfulness & Stress Relief",

    memberImages: [
      "assets/images/person/p7.png",
      "assets/images/person/p8.png",
      "assets/images/person/p9.png",
      "assets/images/person/pall3.png",
    ],
  ),
];

final List<Event> events = [
  Event(
    imagePath: "assets/images/community/pgcook.png",
    title: "Pregnancy Nutrition Webinar",
    date: "20 March 2025",
    location: "Cairo",
  ),
  Event(
    imagePath: "assets/images/community/pg1.png",
    title: "Prenatal Yoga Workshop",
    date: "25 March 2025",
    location: "New York",
  ),
];
