// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LalaMoveStopsDataStruct extends FFFirebaseStruct {
  LalaMoveStopsDataStruct({
    String? lat,
    String? lng,
    AddressStruct? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lat = lat,
        _lng = lng,
        _address = address,
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

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  set address(AddressStruct? val) => _address = val;

  void updateAddress(Function(AddressStruct) updateFn) {
    updateFn(_address ??= AddressStruct());
  }

  bool hasAddress() => _address != null;

  static LalaMoveStopsDataStruct fromMap(Map<String, dynamic> data) =>
      LalaMoveStopsDataStruct(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
        address: AddressStruct.maybeFromMap(data['address']),
      );

  static LalaMoveStopsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LalaMoveStopsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lng': _lng,
        'address': _address?.toMap(),
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
        'address': serializeParam(
          _address,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LalaMoveStopsDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LalaMoveStopsDataStruct(
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
        address: deserializeStructParam(
          data['address'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LalaMoveStopsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LalaMoveStopsDataStruct &&
        lat == other.lat &&
        lng == other.lng &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lng, address]);
}

LalaMoveStopsDataStruct createLalaMoveStopsDataStruct({
  String? lat,
  String? lng,
  AddressStruct? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LalaMoveStopsDataStruct(
      lat: lat,
      lng: lng,
      address: address ?? (clearUnsetFields ? AddressStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LalaMoveStopsDataStruct? updateLalaMoveStopsDataStruct(
  LalaMoveStopsDataStruct? lalaMoveStopsData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lalaMoveStopsData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLalaMoveStopsDataStructData(
  Map<String, dynamic> firestoreData,
  LalaMoveStopsDataStruct? lalaMoveStopsData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lalaMoveStopsData == null) {
    return;
  }
  if (lalaMoveStopsData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lalaMoveStopsData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lalaMoveStopsDataData =
      getLalaMoveStopsDataFirestoreData(lalaMoveStopsData, forFieldValue);
  final nestedData =
      lalaMoveStopsDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lalaMoveStopsData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLalaMoveStopsDataFirestoreData(
  LalaMoveStopsDataStruct? lalaMoveStopsData, [
  bool forFieldValue = false,
]) {
  if (lalaMoveStopsData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lalaMoveStopsData.toMap());

  // Handle nested data for "address" field.
  addAddressStructData(
    firestoreData,
    lalaMoveStopsData.hasAddress() ? lalaMoveStopsData.address : null,
    'address',
    forFieldValue,
  );

  // Add any Firestore field values
  lalaMoveStopsData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLalaMoveStopsDataListFirestoreData(
  List<LalaMoveStopsDataStruct>? lalaMoveStopsDatas,
) =>
    lalaMoveStopsDatas
        ?.map((e) => getLalaMoveStopsDataFirestoreData(e, true))
        .toList() ??
    [];
