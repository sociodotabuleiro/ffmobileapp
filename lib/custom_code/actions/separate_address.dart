// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> separateAddress(
  BuildContext context,
  FFPlace placeAddress,
) async {
  // Example format: "Av Presidente Vargas, 688 - Centro, Nova Prata - RS, 95320-000, Brasil"
  String address = placeAddress.address;
  List<String> separatedAddress = [];

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

  // Adding extracted components to the list in a specific order
  separatedAddress
      .addAll([street, number, neighborhood, city, state, zip, country]);

  return separatedAddress;
}
