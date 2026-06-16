import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ta.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ta'),
    Locale('zh'),
    Locale('zh', 'CN')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get hello;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start Planning'**
  String get start;

  /// No description provided for @book.
  ///
  /// In en, this message translates to:
  /// **'Booking tickets early and choosing budget-friendly accommodations can help reduce costs.'**
  String get book;

  /// No description provided for @how.
  ///
  /// In en, this message translates to:
  /// **'2. How can I save money while traveling?'**
  String get how;

  /// No description provided for @theBest.
  ///
  /// In en, this message translates to:
  /// **'The best time depends on the destination and your personal preferences.'**
  String get theBest;

  /// No description provided for @what.
  ///
  /// In en, this message translates to:
  /// **'1. What is the best time to travel?'**
  String get what;

  /// No description provided for @freq.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get freq;

  /// No description provided for @trav.
  ///
  /// In en, this message translates to:
  /// **'Travel is the only thing you buy that makes you richer.'**
  String get trav;

  /// No description provided for @always.
  ///
  /// In en, this message translates to:
  /// **'Always plan your trip in advance, keep copies of important documents, and respect local customs. Carry enough water, stay connected with your loved ones, and prioritize safety during your journey.'**
  String get always;

  /// No description provided for @travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Tips'**
  String get travel;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shopping for souvenirs'**
  String get shop;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Photography and sightseeing'**
  String get photo;

  /// No description provided for @pop.
  ///
  /// In en, this message translates to:
  /// **'Popular Activities'**
  String get pop;

  /// No description provided for @traveling.
  ///
  /// In en, this message translates to:
  /// **'Traveling helps people relax, learn about different traditions, and gain valuable experiences. Whether you prefer mountains, beaches, or cities, every destination offers something unique.'**
  String get traveling;

  /// No description provided for @why.
  ///
  /// In en, this message translates to:
  /// **'Why Travel?'**
  String get why;

  /// No description provided for @traAll.
  ///
  /// In en, this message translates to:
  /// **'Traveling allows you to explore new cultures, experience beautiful landscapes, and create unforgettable memories with friends and family.'**
  String get traAll;

  /// No description provided for @dis.
  ///
  /// In en, this message translates to:
  /// **'Discover Amazing Places'**
  String get dis;

  /// No description provided for @guide.
  ///
  /// In en, this message translates to:
  /// **'Travel Guide'**
  String get guide;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'ta', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh': {
  switch (locale.countryCode) {
    case 'CN': return AppLocalizationsZhCn();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'ta': return AppLocalizationsTa();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
