// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotationsStruct extends FFFirebaseStruct {
  QuotationsStruct({
    DocumentReference? ownerRef,
    LalamoveQuotationDataStruct? quotationsData,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ownerRef = ownerRef,
        _quotationsData = quotationsData,
        super(firestoreUtilData);

  // "ownerRef" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  set ownerRef(DocumentReference? val) => _ownerRef = val;

  bool hasOwnerRef() => _ownerRef != null;

  // "quotationsData" field.
  LalamoveQuotationDataStruct? _quotationsData;
  LalamoveQuotationDataStruct get quotationsData =>
      _quotationsData ?? LalamoveQuotationDataStruct();
  set quotationsData(LalamoveQuotationDataStruct? val) => _quotationsData = val;

  void updateQuotationsData(Function(LalamoveQuotationDataStruct) updateFn) {
    updateFn(_quotationsData ??= LalamoveQuotationDataStruct());
  }

  bool hasQuotationsData() => _quotationsData != null;

  static QuotationsStruct fromMap(Map<String, dynamic> data) =>
      QuotationsStruct(
        ownerRef: data['ownerRef'] as DocumentReference?,
        quotationsData:
            LalamoveQuotationDataStruct.maybeFromMap(data['quotationsData']),
      );

  static QuotationsStruct? maybeFromMap(dynamic data) => data is Map
      ? QuotationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ownerRef': _ownerRef,
        'quotationsData': _quotationsData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ownerRef': serializeParam(
          _ownerRef,
          ParamType.DocumentReference,
        ),
        'quotationsData': serializeParam(
          _quotationsData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static QuotationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuotationsStruct(
        ownerRef: deserializeParam(
          data['ownerRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        quotationsData: deserializeStructParam(
          data['quotationsData'],
          ParamType.DataStruct,
          false,
          structBuilder: LalamoveQuotationDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuotationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuotationsStruct &&
        ownerRef == other.ownerRef &&
        quotationsData == other.quotationsData;
  }

  @override
  int get hashCode => const ListEquality().hash([ownerRef, quotationsData]);
}

QuotationsStruct createQuotationsStruct({
  DocumentReference? ownerRef,
  LalamoveQuotationDataStruct? quotationsData,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuotationsStruct(
      ownerRef: ownerRef,
      quotationsData: quotationsData ??
          (clearUnsetFields ? LalamoveQuotationDataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuotationsStruct? updateQuotationsStruct(
  QuotationsStruct? quotations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quotations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuotationsStructData(
  Map<String, dynamic> firestoreData,
  QuotationsStruct? quotations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quotations == null) {
    return;
  }
  if (quotations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && quotations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quotationsData = getQuotationsFirestoreData(quotations, forFieldValue);
  final nestedData = quotationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = quotations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuotationsFirestoreData(
  QuotationsStruct? quotations, [
  bool forFieldValue = false,
]) {
  if (quotations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quotations.toMap());

  // Handle nested data for "quotationsData" field.
  addLalamoveQuotationDataStructData(
    firestoreData,
    quotations.hasQuotationsData() ? quotations.quotationsData : null,
    'quotationsData',
    forFieldValue,
  );

  // Add any Firestore field values
  quotations.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuotationsListFirestoreData(
  List<QuotationsStruct>? quotationss,
) =>
    quotationss?.map((e) => getQuotationsFirestoreData(e, true)).toList() ?? [];
