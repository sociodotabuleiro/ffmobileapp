// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DistanceStruct extends FFFirebaseStruct {
  DistanceStruct({
    String? unit,
    double? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _unit = unit,
        _value = value,
        super(firestoreUtilData);

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static DistanceStruct fromMap(Map<String, dynamic> data) => DistanceStruct(
        unit: data['unit'] as String?,
        value: castToType<double>(data['value']),
      );

  static DistanceStruct? maybeFromMap(dynamic data) =>
      data is Map ? DistanceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'unit': _unit,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static DistanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      DistanceStruct(
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DistanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DistanceStruct &&
        unit == other.unit &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([unit, value]);
}

DistanceStruct createDistanceStruct({
  String? unit,
  double? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DistanceStruct(
      unit: unit,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DistanceStruct? updateDistanceStruct(
  DistanceStruct? distance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    distance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDistanceStructData(
  Map<String, dynamic> firestoreData,
  DistanceStruct? distance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (distance == null) {
    return;
  }
  if (distance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && distance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final distanceData = getDistanceFirestoreData(distance, forFieldValue);
  final nestedData = distanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = distance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDistanceFirestoreData(
  DistanceStruct? distance, [
  bool forFieldValue = false,
]) {
  if (distance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(distance.toMap());

  // Add any Firestore field values
  distance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDistanceListFirestoreData(
  List<DistanceStruct>? distances,
) =>
    distances?.map((e) => getDistanceFirestoreData(e, true)).toList() ?? [];
