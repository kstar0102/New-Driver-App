import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @wrongPwd.
  ///
  /// In en, this message translates to:
  /// **'Wrong password'**
  String get wrongPwd;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// No description provided for @forgetPwd.
  ///
  /// In en, this message translates to:
  /// **'FORGET PASSWORD'**
  String get forgetPwd;

  /// No description provided for @weWillSendAOneTime.
  ///
  /// In en, this message translates to:
  /// **'We will send a one time'**
  String get weWillSendAOneTime;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// No description provided for @onYourMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'on \n your mobile number'**
  String get onYourMobileNumber;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'MOBILE NUMBER'**
  String get mobileNumber;

  /// No description provided for @an.
  ///
  /// In en, this message translates to:
  /// **'An '**
  String get an;

  /// No description provided for @wasSentToYourMobile.
  ///
  /// In en, this message translates to:
  /// **' was sent to your \n mobile number.'**
  String get wasSentToYourMobile;

  /// No description provided for @didNotreceiveThe.
  ///
  /// In en, this message translates to:
  /// **'Did not receive the verification OTP?'**
  String get didNotreceiveThe;

  /// No description provided for @resendOTPIn.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP in '**
  String get resendOTPIn;

  /// No description provided for @enterYourNewPwd.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password below'**
  String get enterYourNewPwd;

  /// No description provided for @newPwd.
  ///
  /// In en, this message translates to:
  /// **'NEW PASSWORD'**
  String get newPwd;

  /// No description provided for @confirmPwd.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM PASSWORD'**
  String get confirmPwd;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get login;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'USERNAME'**
  String get username;

  /// No description provided for @pwd.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get pwd;

  /// No description provided for @emailCantBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email can\'t be empty.'**
  String get emailCantBeEmpty;

  /// No description provided for @invalidEmailAddr.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get invalidEmailAddr;

  /// No description provided for @pwdCantBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty.'**
  String get pwdCantBeEmpty;

  /// No description provided for @pwdIsTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password is too short.'**
  String get pwdIsTooShort;

  /// No description provided for @trip.
  ///
  /// In en, this message translates to:
  /// **'TRIP'**
  String get trip;

  /// No description provided for @currentPwdCantBe.
  ///
  /// In en, this message translates to:
  /// **'Current password can\'t be empty.'**
  String get currentPwdCantBe;

  /// No description provided for @pleaseInputNewPwd.
  ///
  /// In en, this message translates to:
  /// **'Please input new password.'**
  String get pleaseInputNewPwd;

  /// No description provided for @pleaseInputConfirmPwd.
  ///
  /// In en, this message translates to:
  /// **'Please input confirm new password.'**
  String get pleaseInputConfirmPwd;

  /// No description provided for @newPwdsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'New passwords do not match.'**
  String get newPwdsDoNotMatch;

  /// No description provided for @changedPwdSuccess.
  ///
  /// In en, this message translates to:
  /// **'Changed password successfully.'**
  String get changedPwdSuccess;

  /// No description provided for @changePwd.
  ///
  /// In en, this message translates to:
  /// **'CHANGE PASSWORD'**
  String get changePwd;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'SAVE'**
  String get save;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'unknown'**
  String get unknown;

  /// No description provided for @updatedProfileSuccess.
  ///
  /// In en, this message translates to:
  /// **'Updated profile successfully.'**
  String get updatedProfileSuccess;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'EDIT PROFILE'**
  String get editProfile;

  /// No description provided for @usernameCantBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Username can\'t be empty.'**
  String get usernameCantBeEmpty;

  /// No description provided for @phoneNumberIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Phone number is not valid.'**
  String get phoneNumberIsNotValid;

  /// No description provided for @dateOfBirthCantBe.
  ///
  /// In en, this message translates to:
  /// **'Date of birth can\'t be empty.'**
  String get dateOfBirthCantBe;

  /// No description provided for @dateOfBirthIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Date of birth is not valid.'**
  String get dateOfBirthIsNotValid;

  /// No description provided for @addrCantBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Address can\'t be empty.'**
  String get addrCantBeEmpty;

  /// No description provided for @editProfile2.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile2;

  /// No description provided for @workingHours.
  ///
  /// In en, this message translates to:
  /// **'Working Hours'**
  String get workingHours;

  /// No description provided for @totalDistance.
  ///
  /// In en, this message translates to:
  /// **'Total Distance'**
  String get totalDistance;

  /// No description provided for @totalTrips.
  ///
  /// In en, this message translates to:
  /// **'Total Trips'**
  String get totalTrips;

  /// No description provided for @changePwd2.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePwd2;

  /// No description provided for @callAppSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Call App Supervisor'**
  String get callAppSupervisor;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'LOG OUT'**
  String get logOut;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get appVersion;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @addr.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addr;

  /// No description provided for @currentPwd.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPwd;

  /// No description provided for @newPwd2.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPwd2;

  /// No description provided for @confirmNewPwd.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPwd;

  /// No description provided for @todayTrips.
  ///
  /// In en, this message translates to:
  /// **'TODAY TRIPS'**
  String get todayTrips;

  /// No description provided for @pastTrips.
  ///
  /// In en, this message translates to:
  /// **'PAST TRIPS'**
  String get pastTrips;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @busNo.
  ///
  /// In en, this message translates to:
  /// **'BUS NO.'**
  String get busNo;

  /// No description provided for @passengers.
  ///
  /// In en, this message translates to:
  /// **'Passengers'**
  String get passengers;

  /// No description provided for @reasonForRejection.
  ///
  /// In en, this message translates to:
  /// **'REASON FOR REJECTION'**
  String get reasonForRejection;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'DETAILS'**
  String get details;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'ACCEPT'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'REJECT'**
  String get reject;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get start;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'FINISH'**
  String get finish;

  /// No description provided for @navigation.
  ///
  /// In en, this message translates to:
  /// **'NAVIGATION'**
  String get navigation;

  /// No description provided for @originLocation.
  ///
  /// In en, this message translates to:
  /// **'ORIGIN LOCATION'**
  String get originLocation;

  /// No description provided for @destLocation.
  ///
  /// In en, this message translates to:
  /// **'DESTINATION LOCATION'**
  String get destLocation;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @startTrip.
  ///
  /// In en, this message translates to:
  /// **'START TRIP'**
  String get startTrip;

  /// No description provided for @finishTrip.
  ///
  /// In en, this message translates to:
  /// **'FINISH TRIP'**
  String get finishTrip;

  /// No description provided for @goingTo.
  ///
  /// In en, this message translates to:
  /// **'Going to'**
  String get goingTo;

  /// No description provided for @destLocation2.
  ///
  /// In en, this message translates to:
  /// **'Destination Location'**
  String get destLocation2;

  /// No description provided for @orginLocation2.
  ///
  /// In en, this message translates to:
  /// **'Origin Location'**
  String get orginLocation2;

  /// No description provided for @newPendingTrip.
  ///
  /// In en, this message translates to:
  /// **'New pending trip'**
  String get newPendingTrip;

  /// No description provided for @tripHasBeenAccepted.
  ///
  /// In en, this message translates to:
  /// **'Trip has been accepted'**
  String get tripHasBeenAccepted;

  /// No description provided for @tripHasBeenRejected.
  ///
  /// In en, this message translates to:
  /// **'Trip has been rejected'**
  String get tripHasBeenRejected;

  /// No description provided for @tripHasBeenStarted.
  ///
  /// In en, this message translates to:
  /// **'Trip has been started'**
  String get tripHasBeenStarted;

  /// No description provided for @tripHasBeenFinished.
  ///
  /// In en, this message translates to:
  /// **'Trip has been finished'**
  String get tripHasBeenFinished;

  /// No description provided for @tripHasBeenCanceled.
  ///
  /// In en, this message translates to:
  /// **'Trip has been canceled'**
  String get tripHasBeenCanceled;

  /// No description provided for @tripHasBeenFaked.
  ///
  /// In en, this message translates to:
  /// **'Trip has been fake'**
  String get tripHasBeenFaked;

  /// No description provided for @unknownStatus.
  ///
  /// In en, this message translates to:
  /// **'unknown status...'**
  String get unknownStatus;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @started.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get started;

  /// No description provided for @finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// No description provided for @fake.
  ///
  /// In en, this message translates to:
  /// **'Fake'**
  String get fake;

  /// No description provided for @requestToAPIServer.
  ///
  /// In en, this message translates to:
  /// **'Request to API server was cancelled.'**
  String get requestToAPIServer;

  /// No description provided for @connectionTimeoutWith.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout with API server.'**
  String get connectionTimeoutWith;

  /// No description provided for @receiveTimeoutInConnect.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout in connection with API server.'**
  String get receiveTimeoutInConnect;

  /// No description provided for @sendTimeoutInConnect.
  ///
  /// In en, this message translates to:
  /// **'Send timeout in connection with API server.'**
  String get sendTimeoutInConnect;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet'**
  String get noInternet;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred.'**
  String get unexpectedError;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get somethingWentWrong;

  /// No description provided for @badRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad request'**
  String get badRequest;

  /// No description provided for @unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get unauthorized;

  /// No description provided for @forbidden.
  ///
  /// In en, this message translates to:
  /// **'Forbidden'**
  String get forbidden;

  /// No description provided for @internalServerErr.
  ///
  /// In en, this message translates to:
  /// **'Internal server error'**
  String get internalServerErr;

  /// No description provided for @badGateway.
  ///
  /// In en, this message translates to:
  /// **'Bad gateway'**
  String get badGateway;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong.'**
  String get oops;

  /// No description provided for @pageNotFount.
  ///
  /// In en, this message translates to:
  /// **'404 - Page not found!'**
  String get pageNotFount;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @notImplemented.
  ///
  /// In en, this message translates to:
  /// **'Not implemented'**
  String get notImplemented;

  /// No description provided for @youHaveAccepted.
  ///
  /// In en, this message translates to:
  /// **'You have accepted trip # '**
  String get youHaveAccepted;

  /// No description provided for @youHaveRejected.
  ///
  /// In en, this message translates to:
  /// **'You have rejected trip # '**
  String get youHaveRejected;

  /// No description provided for @youHaveStarted.
  ///
  /// In en, this message translates to:
  /// **'You have started trip # '**
  String get youHaveStarted;

  /// No description provided for @youHaveFinished.
  ///
  /// In en, this message translates to:
  /// **'You have finished trip # '**
  String get youHaveFinished;

  /// No description provided for @youHaveCanceled.
  ///
  /// In en, this message translates to:
  /// **'You have canceled trip # '**
  String get youHaveCanceled;

  /// No description provided for @okay.
  ///
  /// In en, this message translates to:
  /// **'OKAY'**
  String get okay;

  /// No description provided for @areYouSureAccept.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to accept the trip # '**
  String get areYouSureAccept;

  /// No description provided for @areYouSureStart.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to start the trip # '**
  String get areYouSureStart;

  /// No description provided for @areYouSureFinish.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to finish the trip # '**
  String get areYouSureFinish;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get no;

  /// CANCEL description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cancel;

  /// No description provided for @youAreRejecting.
  ///
  /// In en, this message translates to:
  /// **'You are rejecting trip # '**
  String get youAreRejecting;

  /// No description provided for @pleaseFillTheReason.
  ///
  /// In en, this message translates to:
  /// **'Please fill the reason for rejection!'**
  String get pleaseFillTheReason;

  /// No description provided for @logOut2.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut2;

  /// No description provided for @areYouSureLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSureLogout;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'SEND'**
  String get send;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'VERIFY'**
  String get verify;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'RESET'**
  String get reset;

  /// No description provided for @unknown2.
  ///
  /// In en, this message translates to:
  /// **'UNKNOWN'**
  String get unknown2;

  /// No description provided for @trips.
  ///
  /// In en, this message translates to:
  /// **'TRIPS'**
  String get trips;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'NOTIFICATION'**
  String get notification;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get account;

  /// No description provided for @details2.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details2;

  /// No description provided for @tracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get tracking;

  /// No description provided for @trackPending.
  ///
  /// In en, this message translates to:
  /// **'Trip has been created.'**
  String get trackPending;

  /// No description provided for @trackAccepted.
  ///
  /// In en, this message translates to:
  /// **'Trip has been accepted by driver.'**
  String get trackAccepted;

  /// No description provided for @trackRejected.
  ///
  /// In en, this message translates to:
  /// **'Trip has bee rejected by driver.'**
  String get trackRejected;

  /// No description provided for @trackStarted.
  ///
  /// In en, this message translates to:
  /// **'Trip has been started.'**
  String get trackStarted;

  /// No description provided for @trackFinished.
  ///
  /// In en, this message translates to:
  /// **'Trip has been finished.'**
  String get trackFinished;

  /// No description provided for @trackCanceled.
  ///
  /// In en, this message translates to:
  /// **'Trip has been canceled.'**
  String get trackCanceled;

  /// No description provided for @trackFake.
  ///
  /// In en, this message translates to:
  /// **'Trip has been Faked.'**
  String get trackFake;

  /// **'Remove'**
  String get removed;

  /// **'Update'**
  String get updated;

  /// **'Would you like to update your picture?'**
  String get update_image;

  /// **'Update picture.'**
  String get image_title;

  /// **'Search client, bus or trip'**
  String get search_hint;

  /// **'There is no data'**
  String get no_data;

  /// **'AM'**
  String get AM;

  /// **'PM'**
  String get PM;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
