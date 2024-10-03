// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ToRentListsStruct extends FFFirebaseStruct {
  ToRentListsStruct({
    DocumentReference? userRef,
    DocumentReference? myGamesRef,
    double? deliveryQuoation,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _myGamesRef = myGamesRef,
        _deliveryQuoation = deliveryQuoation,
        super(firestoreUtilData);

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "myGamesRef" field.
  DocumentReference? _myGamesRef;
  DocumentReference? get myGamesRef => _myGamesRef;
  set myGamesRef(DocumentReference? val) => _myGamesRef = val;

  bool hasMyGamesRef() => _myGamesRef != null;

  // "deliveryQuoation" field.
  double? _deliveryQuoation;
  double get deliveryQuoation => _deliveryQuoation ?? 0.0;
  set deliveryQuoation(double? val) => _deliveryQuoation = val;

  void incrementDeliveryQuoation(double amount) =>
      deliveryQuoation = deliveryQuoation + amount;

  bool hasDeliveryQuoation() => _deliveryQuoation != null;

  static ToRentListsStruct fromMap(Map<String, dynamic> data) =>
      ToRentListsStruct(
        userRef: data['userRef'] as DocumentReference?,
        myGamesRef: data['myGamesRef'] as DocumentReference?,
        deliveryQuoation: castToType<double>(data['deliveryQuoation']),
      );

  static ToRentListsStruct? maybeFromMap(dynamic data) => data is Map
      ? ToRentListsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userRef': _userRef,
        'myGamesRef': _myGamesRef,
        'deliveryQuoation': _deliveryQuoation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'myGamesRef': serializeParam(
          _myGamesRef,
          ParamType.DocumentReference,
        ),
        'deliveryQuoation': serializeParam(
          _deliveryQuoation,
          ParamType.double,
        ),
      }.withoutNulls;

  static ToRentListsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ToRentListsStruct(
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        myGamesRef: deserializeParam(
          data['myGamesRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users', 'myGames'],
        ),
        deliveryQuoation: deserializeParam(
          data['deliveryQuoation'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ToRentListsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ToRentListsStruct &&
        userRef == other.userRef &&
        myGamesRef == other.myGamesRef &&
        deliveryQuoation == other.deliveryQuoation;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userRef, myGamesRef, deliveryQuoation]);
}

ToRentListsStruct createToRentListsStruct({
  DocumentReference? userRef,
  DocumentReference? myGamesRef,
  double? deliveryQuoation,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ToRentListsStruct(
      userRef: userRef,
      myGamesRef: myGamesRef,
      deliveryQuoation: deliveryQuoation,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ToRentListsStruct? updateToRentListsStruct(
  ToRentListsStruct? toRentLists, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    toRentLists
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addToRentListsStructData(
  Map<String, dynamic> firestoreData,
  ToRentListsStruct? toRentLists,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (toRentLists == null) {
    return;
  }
  if (toRentLists.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && toRentLists.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final toRentListsData =
      getToRentListsFirestoreData(toRentLists, forFieldValue);
  final nestedData =
      toRentListsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = toRentLists.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getToRentListsFirestoreData(
  ToRentListsStruct? toRentLists, [
  bool forFieldValue = false,
]) {
  if (toRentLists == null) {
    return {};
  }
  final firestoreData = mapToFirestore(toRentLists.toMap());

  // Add any Firestore field values
  toRentLists.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getToRentListsListFirestoreData(
  List<ToRentListsStruct>? toRentListss,
) =>
    toRentListss?.map((e) => getToRentListsFirestoreData(e, true)).toList() ??
    [];
