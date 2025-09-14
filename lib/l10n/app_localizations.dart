import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_my.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('et'),
    Locale('fi'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kn'),
    Locale('my'),
    Locale('nl'),
    Locale('tl'),
    Locale('zh'),
  ];

  /// Hello greeting
  ///
  /// In en, this message translates to:
  /// **'hello, Jane Doe'**
  String get hellojaneDoe;

  /// Morning greeting
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodmorning;

  /// Fibroids information
  ///
  /// In en, this message translates to:
  /// **'Fibroids mainly affect women.'**
  String get fibroidswomen;

  /// Fibroids description
  ///
  /// In en, this message translates to:
  /// **'Fibroids can disrupt cycles, cause heavy bleeding, and impact fertility.'**
  String get fibroiddiscription;

  /// Logging period option
  ///
  /// In en, this message translates to:
  /// **'Log Period'**
  String get logperiod;

  /// Logging symptoms option
  ///
  /// In en, this message translates to:
  /// **'Log your Symptoms'**
  String get logyoursymptoms;

  /// Logging mood option
  ///
  /// In en, this message translates to:
  /// **'Log your Mood'**
  String get logyourmood;

  /// Personalized health journey
  ///
  /// In en, this message translates to:
  /// **'Tailored Wellness Journey'**
  String get tailoredwellnessjourney;

  /// View all items
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeall;

  /// Wellness tips section
  ///
  /// In en, this message translates to:
  /// **'Personalized Wellness Tips'**
  String get personalizedwellnesstips;

  /// Home page
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Tracking section
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get tracking;

  /// Community section
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// Settings page
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// AI assistant
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get ai;

  /// Symptoms section
  ///
  /// In en, this message translates to:
  /// **'Symptoms'**
  String get symptoms;

  /// Status message
  ///
  /// In en, this message translates to:
  /// **'Everything is fine'**
  String get everythingisfine;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Cramps'**
  String get cramps;

  /// Skin condition
  ///
  /// In en, this message translates to:
  /// **'Acne'**
  String get acne;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Tender breasts'**
  String get tenderbreasts;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Milky nipple discharge'**
  String get milkynippledischarge;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Abdominal pain'**
  String get abdominalpain;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Fatigue'**
  String get fatigue;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Sleepiness'**
  String get sleepiness;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Backache'**
  String get backache;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Frequent urination'**
  String get frequenturination;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Cravings'**
  String get cravings;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Insomnia'**
  String get insomnia;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Headache'**
  String get headache;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Leg cramps'**
  String get legcramps;

  /// Symptom
  ///
  /// In en, this message translates to:
  /// **'Bleeding gums'**
  String get bleedinggums;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get calm;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get happy;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Energetic'**
  String get energetic;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Mood swings'**
  String get moodswings;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Frisky'**
  String get frisky;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Irritated'**
  String get irritated;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get sad;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get anxious;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Depressed'**
  String get depressed;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Very self critical'**
  String get veryselfcritical;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Apathetic'**
  String get apathetic;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Confused'**
  String get confused;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Low energy'**
  String get lowenergy;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Feeling guilty'**
  String get feelingguilty;

  /// Mood option
  ///
  /// In en, this message translates to:
  /// **'Obsessive thoughts'**
  String get obsessivethoughts;

  /// Menstrual cycle
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

  /// Fertility phase
  ///
  /// In en, this message translates to:
  /// **'Fertile'**
  String get fertile;

  /// Ovulation phase
  ///
  /// In en, this message translates to:
  /// **'Ovulation'**
  String get ovulation;

  /// Upcoming menstrual cycle
  ///
  /// In en, this message translates to:
  /// **'Next Period'**
  String get nextperiod;

  /// Health section
  ///
  /// In en, this message translates to:
  /// **'Menstrual & Fertility'**
  String get menstrualfertility;

  /// Pregnancy section
  ///
  /// In en, this message translates to:
  /// **'Pregnancy'**
  String get pregnancy;

  /// Notes section
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// Example note
  ///
  /// In en, this message translates to:
  /// **'New note for example'**
  String get newnoteforexample;

  /// Pregnancy progress
  ///
  /// In en, this message translates to:
  /// **'Week 23 of your pregnancy'**
  String get week23ofyourpregnancy;

  /// More information
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Daily health insights
  ///
  /// In en, this message translates to:
  /// **'My Daily Insights'**
  String get mydailyinsights;

  /// Medical checkups
  ///
  /// In en, this message translates to:
  /// **'Checkup & Vaccination'**
  String get checkupvaccination;

  /// Upcoming medical checkup
  ///
  /// In en, this message translates to:
  /// **'Next Checkup'**
  String get nextcheckup;

  /// Welcome message for community
  ///
  /// In en, this message translates to:
  /// **'Hey Jane Doe, welcome to the'**
  String get heyjaneDoe;

  /// Encouragement to join discussions
  ///
  /// In en, this message translates to:
  /// **'Join discussions, ask questions, and connect with experts!'**
  String get joindiscussion;

  /// Forum section
  ///
  /// In en, this message translates to:
  /// **'Forum'**
  String get forum;

  /// Groups section
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups;

  /// Events section
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;

  /// Search feature for topics
  ///
  /// In en, this message translates to:
  /// **'Find topics, groups, and discussions'**
  String get findtopic;

  /// Menstrual health section
  ///
  /// In en, this message translates to:
  /// **'Menstrual Health'**
  String get menstrualhealth;

  /// Fertility section
  ///
  /// In en, this message translates to:
  /// **'Fertility'**
  String get fertility;

  /// Sexual health section
  ///
  /// In en, this message translates to:
  /// **'Sexual health'**
  String get sexualhealth;

  /// Popular community groups
  ///
  /// In en, this message translates to:
  /// **'Popular Groups'**
  String get populargroups;

  /// Search feature for groups
  ///
  /// In en, this message translates to:
  /// **'Find groups'**
  String get findgroups;

  /// Events and workshops section
  ///
  /// In en, this message translates to:
  /// **'Events & Workshops'**
  String get eventsworkshops;

  /// Details of specific events
  ///
  /// In en, this message translates to:
  /// **'Events Details'**
  String get eventsdetails;

  /// Webinar about pregnancy nutrition
  ///
  /// In en, this message translates to:
  /// **'Pregnancy Nutrition Webinar'**
  String get pregnancynutritionwebinar;

  /// Section describing learning outcomes
  ///
  /// In en, this message translates to:
  /// **'What You’ll Learn'**
  String get whatlearn;

  /// Speakers for an event
  ///
  /// In en, this message translates to:
  /// **'Speakers'**
  String get speakers;

  /// Registration button
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get registernow;

  /// Profile editing option
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editprofile;

  /// Option to invite a partner
  ///
  /// In en, this message translates to:
  /// **'Invite Your Partner To Ovella'**
  String get inviteyourpartnertoovella;

  /// Link to add partner
  ///
  /// In en, this message translates to:
  /// **'Click here to add your partner'**
  String get clickheretoaddyourpartner;

  /// User's personal information section
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalinformation;

  /// User's age
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// User's gender
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// Menstrual and health details
  ///
  /// In en, this message translates to:
  /// **'Menstrual & Health Details'**
  String get menstrualhealthdetails;

  /// Length of menstrual cycle
  ///
  /// In en, this message translates to:
  /// **'Cycle Length'**
  String get cyclelength;

  /// Date of last period
  ///
  /// In en, this message translates to:
  /// **'Last Period'**
  String get lastperiod;

  /// Current pregnancy status
  ///
  /// In en, this message translates to:
  /// **'Pregnancy Status'**
  String get pregnancystatus;

  /// User's health conditions
  ///
  /// In en, this message translates to:
  /// **'Health Conditions'**
  String get healthconditions;

  /// User preferences and notifications
  ///
  /// In en, this message translates to:
  /// **'Preferences & Notifications'**
  String get preferencesnotifications;

  /// Menstrual cycle alerts
  ///
  /// In en, this message translates to:
  /// **'Period Alerts'**
  String get periodalerts;

  /// Tips for pregnancy
  ///
  /// In en, this message translates to:
  /// **'Pregnancy Tips'**
  String get pregnancytips;

  /// Mental health section
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get mentalhealth;

  /// Language selection
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Privacy and data management
  ///
  /// In en, this message translates to:
  /// **'Privacy & Data'**
  String get privacydata;

  /// View insights on data
  ///
  /// In en, this message translates to:
  /// **'View Data Insights'**
  String get viewdatainsights;

  /// Export user data
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportdata;

  /// Delete user account
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteaccount;

  /// Support and community section
  ///
  /// In en, this message translates to:
  /// **'Support & Community'**
  String get supportcommunity;

  /// Support contact information
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactsupport;

  /// Frequently asked questions and guides
  ///
  /// In en, this message translates to:
  /// **'FAQ & Guides'**
  String get faqguides;

  /// Option to join a community
  ///
  /// In en, this message translates to:
  /// **'Join a Community'**
  String get joinacommunity;

  /// Option to join a community
  ///
  /// In en, this message translates to:
  /// **'Events & Workshops'**
  String get eventsAndWorkshops;

  /// Next event
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get upComingEvent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'ar',
    'bg',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'et',
    'fi',
    'fr',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'is',
    'it',
    'ja',
    'ka',
    'kn',
    'my',
    'nl',
    'tl',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'et':
      return AppLocalizationsEt();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ka':
      return AppLocalizationsKa();
    case 'kn':
      return AppLocalizationsKn();
    case 'my':
      return AppLocalizationsMy();
    case 'nl':
      return AppLocalizationsNl();
    case 'tl':
      return AppLocalizationsTl();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
