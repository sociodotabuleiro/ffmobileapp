// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LalamoveMetadataStruct extends FFFirebaseStruct {
  LalamoveMetadataStruct({
    String? orderId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderId = orderId,
        super(firestoreUtilData);

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  static LalamoveMetadataStruct fromMap(Map<String, dynamic> data) =>
      LalamoveMetadataStruct(
        orderId: data['orderId'] as String?,
      );

  static LalamoveMetadataStruct? maybeFromMap(dynamic data) => data is Map
      ? LalamoveMetadataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'orderId': _orderId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderId': serializeParam(
          _orderId,
          ParamType.String,
        ),
      }.withoutNulls;

  static LalamoveMetadataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LalamoveMetadataStruct(
        orderId: deserializeParam(
          data['orderId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LalamoveMetadataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LalamoveMetadataStruct && orderId == other.orderId;
  }

  @override
  int get hashCode => const ListEquality().hash([orderId]);
}

LalamoveMetadataStruct createLalamoveMetadataStruct({
  String? orderId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LalamoveMetadataStruct(
      orderId: orderId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LalamoveMetadataStruct? updateLalamoveMetadataStruct(
  LalamoveMetadataStruct? lalamoveMetadata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lalamoveMetadata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLalamoveMetadataStructData(
  Map<String, dynamic> firestoreData,
  LalamoveMetadataStruct? lalamoveMetadata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lalamoveMetadata == null) {
    return;
  }
  if (lalamoveMetadata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lalamoveMetadata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lalamoveMetadataData =
      getLalamoveMetadataFirestoreData(lalamoveMetadata, forFieldValue);
  final nestedData =
      lalamoveMetadataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lalamoveMetadata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLalamoveMetadataFirestoreData(
  LalamoveMetadataStruct? lalamoveMetadata, [
  bool forFieldValue = false,
]) {
  if (lalamoveMetadata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lalamoveMetadata.toMap());

  // Add any Firestore field values
  lalamoveMetadata.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLalamoveMetadataListFirestoreData(
  List<LalamoveMetadataStruct>? lalamoveMetadatas,
) =>
    lalamoveMetadatas
        ?.map((e) => getLalamoveMetadataFirestoreData(e, true))
        .toList() ??
    [];
