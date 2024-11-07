// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CoordinatesStruct extends FFFirebaseStruct {
  CoordinatesStruct({
    String? lat,
    String? lng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lat = lat,
        _lng = lng,
        super(firestoreUtilData);

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;

  bool hasLat() => _lat != null;

  // "lng" field.
  String? _lng;
  String get lng => _lng ?? '';
  set lng(String? val) => _lng = val;

  bool hasLng() => _lng != null;

  static CoordinatesStruct fromMap(Map<String, dynamic> data) =>
      CoordinatesStruct(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  static CoordinatesStruct? maybeFromMap(dynamic data) => data is Map
      ? CoordinatesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lng': _lng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.String,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.String,
        ),
      }.withoutNulls;

  static CoordinatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoordinatesStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CoordinatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoordinatesStruct && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lng]);
}

CoordinatesStruct createCoordinatesStruct({
  String? lat,
  String? lng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoordinatesStruct(
      lat: lat,
      lng: lng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoordinatesStruct? updateCoordinatesStruct(
  CoordinatesStruct? coordinates, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coordinates
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoordinatesStructData(
  Map<String, dynamic> firestoreData,
  CoordinatesStruct? coordinates,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coordinates == null) {
    return;
  }
  if (coordinates.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coordinates.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coordinatesData =
      getCoordinatesFirestoreData(coordinates, forFieldValue);
  final nestedData =
      coordinatesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coordinates.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoordinatesFirestoreData(
  CoordinatesStruct? coordinates, [
  bool forFieldValue = false,
]) {
  if (coordinates == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coordinates.toMap());

  // Add any Firestore field values
  coordinates.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoordinatesListFirestoreData(
  List<CoordinatesStruct>? coordinatess,
) =>
    coordinatess?.map((e) => getCoordinatesFirestoreData(e, true)).toList() ??
    [];
