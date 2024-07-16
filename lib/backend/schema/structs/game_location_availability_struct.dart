// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameLocationAvailabilityStruct extends FFFirebaseStruct {
  GameLocationAvailabilityStruct({
    String? cityName,
    double? distance,
    double? dayRate,
    double? deliveryRate,
    List<DateTime>? availabilityDates,
    List<LatLng>? coordinates,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cityName = cityName,
        _distance = distance,
        _dayRate = dayRate,
        _deliveryRate = deliveryRate,
        _availabilityDates = availabilityDates,
        _coordinates = coordinates,
        super(firestoreUtilData);

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  set cityName(String? val) => _cityName = val;

  bool hasCityName() => _cityName != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  set distance(double? val) => _distance = val;

  void incrementDistance(double amount) => distance = distance + amount;

  bool hasDistance() => _distance != null;

  // "dayRate" field.
  double? _dayRate;
  double get dayRate => _dayRate ?? 0.0;
  set dayRate(double? val) => _dayRate = val;

  void incrementDayRate(double amount) => dayRate = dayRate + amount;

  bool hasDayRate() => _dayRate != null;

  // "deliveryRate" field.
  double? _deliveryRate;
  double get deliveryRate => _deliveryRate ?? 0.0;
  set deliveryRate(double? val) => _deliveryRate = val;

  void incrementDeliveryRate(double amount) =>
      deliveryRate = deliveryRate + amount;

  bool hasDeliveryRate() => _deliveryRate != null;

  // "availabilityDates" field.
  List<DateTime>? _availabilityDates;
  List<DateTime> get availabilityDates => _availabilityDates ?? const [];
  set availabilityDates(List<DateTime>? val) => _availabilityDates = val;

  void updateAvailabilityDates(Function(List<DateTime>) updateFn) {
    updateFn(_availabilityDates ??= []);
  }

  bool hasAvailabilityDates() => _availabilityDates != null;

  // "coordinates" field.
  List<LatLng>? _coordinates;
  List<LatLng> get coordinates => _coordinates ?? const [];
  set coordinates(List<LatLng>? val) => _coordinates = val;

  void updateCoordinates(Function(List<LatLng>) updateFn) {
    updateFn(_coordinates ??= []);
  }

  bool hasCoordinates() => _coordinates != null;

  static GameLocationAvailabilityStruct fromMap(Map<String, dynamic> data) =>
      GameLocationAvailabilityStruct(
        cityName: data['cityName'] as String?,
        distance: castToType<double>(data['distance']),
        dayRate: castToType<double>(data['dayRate']),
        deliveryRate: castToType<double>(data['deliveryRate']),
        availabilityDates: getDataList(data['availabilityDates']),
        coordinates: getDataList(data['coordinates']),
      );

  static GameLocationAvailabilityStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GameLocationAvailabilityStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'cityName': _cityName,
        'distance': _distance,
        'dayRate': _dayRate,
        'deliveryRate': _deliveryRate,
        'availabilityDates': _availabilityDates,
        'coordinates': _coordinates,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cityName': serializeParam(
          _cityName,
          ParamType.String,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.double,
        ),
        'dayRate': serializeParam(
          _dayRate,
          ParamType.double,
        ),
        'deliveryRate': serializeParam(
          _deliveryRate,
          ParamType.double,
        ),
        'availabilityDates': serializeParam(
          _availabilityDates,
          ParamType.DateTime,
          isList: true,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.LatLng,
          isList: true,
        ),
      }.withoutNulls;

  static GameLocationAvailabilityStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GameLocationAvailabilityStruct(
        cityName: deserializeParam(
          data['cityName'],
          ParamType.String,
          false,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.double,
          false,
        ),
        dayRate: deserializeParam(
          data['dayRate'],
          ParamType.double,
          false,
        ),
        deliveryRate: deserializeParam(
          data['deliveryRate'],
          ParamType.double,
          false,
        ),
        availabilityDates: deserializeParam<DateTime>(
          data['availabilityDates'],
          ParamType.DateTime,
          true,
        ),
        coordinates: deserializeParam<LatLng>(
          data['coordinates'],
          ParamType.LatLng,
          true,
        ),
      );

  @override
  String toString() => 'GameLocationAvailabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GameLocationAvailabilityStruct &&
        cityName == other.cityName &&
        distance == other.distance &&
        dayRate == other.dayRate &&
        deliveryRate == other.deliveryRate &&
        listEquality.equals(availabilityDates, other.availabilityDates) &&
        listEquality.equals(coordinates, other.coordinates);
  }

  @override
  int get hashCode => const ListEquality().hash([
        cityName,
        distance,
        dayRate,
        deliveryRate,
        availabilityDates,
        coordinates
      ]);
}

GameLocationAvailabilityStruct createGameLocationAvailabilityStruct({
  String? cityName,
  double? distance,
  double? dayRate,
  double? deliveryRate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GameLocationAvailabilityStruct(
      cityName: cityName,
      distance: distance,
      dayRate: dayRate,
      deliveryRate: deliveryRate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GameLocationAvailabilityStruct? updateGameLocationAvailabilityStruct(
  GameLocationAvailabilityStruct? gameLocationAvailability, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gameLocationAvailability
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGameLocationAvailabilityStructData(
  Map<String, dynamic> firestoreData,
  GameLocationAvailabilityStruct? gameLocationAvailability,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gameLocationAvailability == null) {
    return;
  }
  if (gameLocationAvailability.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      gameLocationAvailability.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gameLocationAvailabilityData = getGameLocationAvailabilityFirestoreData(
      gameLocationAvailability, forFieldValue);
  final nestedData =
      gameLocationAvailabilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      gameLocationAvailability.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGameLocationAvailabilityFirestoreData(
  GameLocationAvailabilityStruct? gameLocationAvailability, [
  bool forFieldValue = false,
]) {
  if (gameLocationAvailability == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gameLocationAvailability.toMap());

  // Add any Firestore field values
  gameLocationAvailability.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGameLocationAvailabilityListFirestoreData(
  List<GameLocationAvailabilityStruct>? gameLocationAvailabilitys,
) =>
    gameLocationAvailabilitys
        ?.map((e) => getGameLocationAvailabilityFirestoreData(e, true))
        .toList() ??
    [];
