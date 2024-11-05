import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime stringToDate(String sDate) {
  // receive a string in the format DD/MM/YYYY and return it in Date Time format
  final format = DateFormat('dd/MM/yyyy');
  return format.parse(sDate);
}

dynamic separateAddressFromPlace(String address) {
  // Example format: "Av Presidente Vargas, 688 - Centro, Nova Prata - RS, 95320-000, Brasil"

  // Splitting the full address into major components
  List<String> components = address.split(", ");

  // Extracting street name and number
  String street = components[0];
  String number = components[1].split(" - ")[0];

  // Extracting neighborhood
  String neighborhood = components[1].split(" - ")[1];

  // Extracting city and state
  String city = components[2].split(" - ")[0];
  String state = components[2].split(" - ")[1];

  // Extracting ZIP code
  String zip = components[3];

  // Extracting country
  String country = components[4];

  // Constructing a Map with descriptive keys
  Map<String, String> addressDetails = {
    'street': street,
    'number': number,
    'neighborhood': neighborhood,
    'city': city,
    'state': state,
    'zip': zip,
    'country': country,
  };

  return addressDetails;
}

bool checkGameRefInJson(
  dynamic jsonList,
  DocumentReference gameRef,
) {
  // create a function to check if a given document reference is a value in a json object
  if (jsonList == null || gameRef == null) {
    return false;
  }
  final gameRefString = gameRef.path;
  final jsonMap = json.decode(json.encode(jsonList));
  return jsonMap.containsValue(gameRefString);
}

List<DateTime>? getOnlyLaterDates(
  List<DateTime> dates,
  String choosenDate,
) {
  // Parse the choosenDate string to a DateTime object
  DateFormat dateFormat = DateFormat('d/M/y');
  DateTime chosenDateTime = dateFormat.parse(choosenDate);

  // Create a function that inputs a list of DateTime objects and returns the list of dates that are later than the chosen date.
  List<DateTime> laterDates = [];
  for (DateTime date in dates) {
    if (date.isAfter(chosenDateTime) || date.isAtSameMomentAs(chosenDateTime)) {
      laterDates.add(date);
    }
  }
  return laterDates.isEmpty ? null : laterDates;
}

int getDaysBetween2Dates(
  String date1,
  String date2,
) {
  // get 2 dates in format d/M/y and return how many days between them
  final dateFormat = DateFormat('d/M/y');
  final parsedDate1 = dateFormat.parse(date1);
  final parsedDate2 = dateFormat.parse(date2);
  final difference = parsedDate2.difference(parsedDate1);
  return difference.inDays;
}

double priceForDays(
  String date1,
  String date2,
  double price,
) {
  final int days = getDaysBetween2Dates(date1, date2);
  return (days + 1) * price;
}

double getLatLngSeparated(
  bool isLatitude,
  LatLng latlng,
) {
  // create a function to return lat if islatitude is true, and return lng if it is false, using the input latlng
  if (isLatitude) {
    return latlng.latitude;
  } else {
    return latlng.longitude;
  }
}

String getCurrentTimeInIso8601(int minutesToAdd) {
  // Get the current time
  DateTime currentTime = DateTime.now();

  // Add the specified number of minutes
  DateTime newTime = currentTime.add(Duration(minutes: minutesToAdd));

  // Format as ISO 8601 string
  String iso8601String = DateFormat("yyyy-MM-ddTHH:mm:ss").format(newTime);

  // Calculate and format the timezone offset
  String timezoneOffset = newTime.timeZoneOffset.isNegative ? "-" : "+";
  timezoneOffset += newTime.timeZoneOffset.inHours
          .abs()
          .toString()
          .padLeft(2, '0') +
      ":" +
      (newTime.timeZoneOffset.inMinutes.abs() % 60).toString().padLeft(2, '0');

  // Return the final ISO 8601 formatted string with timezone
  return "$iso8601String$timezoneOffset";
}

List<DateTime> convertUnixStringsToDateTime(List<String> unixList) {
  // Initialize an empty list to hold the converted DateTime objects
  List<DateTime> dateTimeList = [];

  // Loop through the Unix time strings stored in FFAppState().fbTimestamp
  for (String unixString in unixList) {
    // Convert the Unix time string back to an integer
    int unixTime = int.parse(unixString);

    // Convert the Unix time (in seconds) to a DateTime object
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);

    // Add the DateTime object to the list
    dateTimeList.add(dateTime);
  }

  // Return the list of DateTime objects
  return dateTimeList;
}

String generateLalamoveSttop(
  String lat,
  String lng,
  String street,
  String number,
  String neighborhood,
  String city,
  String state,
  String zip,
) {
  String address = "$street, $number - $neighborhood, $city - $state, $zip";

  // Creating a JSON-like formatted string using the received data
  return '''
  {
    "coordinates": {
      "lat": "$lat",
      "lng": "$lng"
    },
    "address": "$address"
  }
  ''';
}

String normalizeString(String string2beNormalized) {
  // create a function to receive a string in pt_BR, and normalize it to be all lowercase and no diacritics
  return string2beNormalized
      .toLowerCase()
      .replaceAll(RegExp(r'[áàãâä]'), 'a')
      .replaceAll(RegExp(r'[éèêë]'), 'e')
      .replaceAll(RegExp(r'[íìîï]'), 'i')
      .replaceAll(RegExp(r'[óòõôö]'), 'o')
      .replaceAll(RegExp(r'[úùûü]'), 'u')
      .replaceAll(RegExp(r'[ç]'), 'c');
}

List<DateTime> createListofDateTime30DaysFromToday() {
  // create List of DateTime that is composed by 30 days from the current day. The date is important, the time is not.
  List<DateTime> dateList = [];
  DateTime currentDate = DateTime.now();
  for (int i = 0; i < 30; i++) {
    dateList.add(
        DateTime(currentDate.year, currentDate.month, currentDate.day + i));
  }
  return dateList;
}

double stringToDouble(String stringValue) {
  // return the string casted as double, could be that the string is masked with currency letter, so treat this case and the decimal separator is comma
  // Remove any non-numeric characters from the string
  String cleanedString = stringValue.replaceAll(RegExp(r'[^0-9,]'), '');

  // Replace comma with dot for decimal separator
  cleanedString = cleanedString.replaceAll(',', '.');

  // Parse the cleaned string to double
  double result = double.parse(cleanedString);

  return result;
}

String unifyAddress(AddressStruct addressObject) {
  // function to return Address proprieties as a string to be used by other funtions to recover Lat and Lng
  return '$addressObject.street $addressObject.number, $addressObject.city - $addressObject.state, $addressObject.country, $addressObject.zip';
}

int countCharacters(String string) {
  // function to count all characters from a string and return the value
  return string.length;
}
