// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StopsStruct extends FFFirebaseStruct {
  StopsStruct({
    String? stopId,
    CoordinatesStruct? coordinates,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stopId = stopId,
        _coordinates = coordinates,
        _address = address,
        super(firestoreUtilData);

  // "stopId" field.
  String? _stopId;
  String get stopId => _stopId ?? '';
  set stopId(String? val) => _stopId = val;

  bool hasStopId() => _stopId != null;

  // "coordinates" field.
  CoordinatesStruct? _coordinates;
  CoordinatesStruct get coordinates => _coordinates ?? CoordinatesStruct();
  set coordinates(CoordinatesStruct? val) => _coordinates = val;

  void updateCoordinates(Function(CoordinatesStruct) updateFn) {
    updateFn(_coordinates ??= CoordinatesStruct());
  }

  bool hasCoordinates() => _coordinates != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  static StopsStruct fromMap(Map<String, dynamic> data) => StopsStruct(
        stopId: data['stopId'] as String?,
        coordinates: data['coordinates'] is CoordinatesStruct
            ? data['coordinates']
            : CoordinatesStruct.maybeFromMap(data['coordinates']),
        address: data['address'] as String?,
      );

  static StopsStruct? maybeFromMap(dynamic data) =>
      data is Map ? StopsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'stopId': _stopId,
        'coordinates': _coordinates?.toMap(),
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stopId': serializeParam(
          _stopId,
          ParamType.String,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.DataStruct,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static StopsStruct fromSerializableMap(Map<String, dynamic> data) =>
      StopsStruct(
        stopId: deserializeParam(
          data['stopId'],
          ParamType.String,
          false,
        ),
        coordinates: deserializeStructParam(
          data['coordinates'],
          ParamType.DataStruct,
          false,
          structBuilder: CoordinatesStruct.fromSerializableMap,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StopsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StopsStruct &&
        stopId == other.stopId &&
        coordinates == other.coordinates &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([stopId, coordinates, address]);
}

StopsStruct createStopsStruct({
  String? stopId,
  CoordinatesStruct? coordinates,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StopsStruct(
      stopId: stopId,
      coordinates:
          coordinates ?? (clearUnsetFields ? CoordinatesStruct() : null),
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StopsStruct? updateStopsStruct(
  StopsStruct? stops, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stops
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStopsStructData(
  Map<String, dynamic> firestoreData,
  StopsStruct? stops,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stops == null) {
    return;
  }
  if (stops.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stops.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stopsData = getStopsFirestoreData(stops, forFieldValue);
  final nestedData = stopsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stops.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStopsFirestoreData(
  StopsStruct? stops, [
  bool forFieldValue = false,
]) {
  if (stops == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stops.toMap());

  // Handle nested data for "coordinates" field.
  addCoordinatesStructData(
    firestoreData,
    stops.hasCoordinates() ? stops.coordinates : null,
    'coordinates',
    forFieldValue,
  );

  // Add any Firestore field values
  stops.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStopsListFirestoreData(
  List<StopsStruct>? stopss,
) =>
    stopss?.map((e) => getStopsFirestoreData(e, true)).toList() ?? [];
