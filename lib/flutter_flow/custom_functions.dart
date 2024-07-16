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

DocumentReference? refFromWishlistArray(
  dynamic jsonObject,
  DocumentReference targetRef,
  DocumentReference userRef,
) {
  for (var entry in jsonObject.entries) {
    if (entry.value is DocumentReference && entry.value == targetRef) {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userRef.id)
          .collection('wishlist')
          .doc(entry.key);
    }
  }
  // If no match found, return null
  return null;
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
