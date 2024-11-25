// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameToAddStruct extends FFFirebaseStruct {
  GameToAddStruct({
    DocumentReference? gameRef,
    double? rentValue,
    bool? isAvailableToRent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _gameRef = gameRef,
        _rentValue = rentValue,
        _isAvailableToRent = isAvailableToRent,
        super(firestoreUtilData);

  // "gameRef" field.
  DocumentReference? _gameRef;
  DocumentReference? get gameRef => _gameRef;
  set gameRef(DocumentReference? val) => _gameRef = val;

  bool hasGameRef() => _gameRef != null;

  // "rentValue" field.
  double? _rentValue;
  double get rentValue => _rentValue ?? 0.0;
  set rentValue(double? val) => _rentValue = val;

  void incrementRentValue(double amount) => rentValue = rentValue + amount;

  bool hasRentValue() => _rentValue != null;

  // "isAvailableToRent" field.
  bool? _isAvailableToRent;
  bool get isAvailableToRent => _isAvailableToRent ?? false;
  set isAvailableToRent(bool? val) => _isAvailableToRent = val;

  bool hasIsAvailableToRent() => _isAvailableToRent != null;

  static GameToAddStruct fromMap(Map<String, dynamic> data) => GameToAddStruct(
        gameRef: data['gameRef'] as DocumentReference?,
        rentValue: castToType<double>(data['rentValue']),
        isAvailableToRent: data['isAvailableToRent'] as bool?,
      );

  static GameToAddStruct? maybeFromMap(dynamic data) => data is Map
      ? GameToAddStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gameRef': _gameRef,
        'rentValue': _rentValue,
        'isAvailableToRent': _isAvailableToRent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gameRef': serializeParam(
          _gameRef,
          ParamType.DocumentReference,
        ),
        'rentValue': serializeParam(
          _rentValue,
          ParamType.double,
        ),
        'isAvailableToRent': serializeParam(
          _isAvailableToRent,
          ParamType.bool,
        ),
      }.withoutNulls;

  static GameToAddStruct fromSerializableMap(Map<String, dynamic> data) =>
      GameToAddStruct(
        gameRef: deserializeParam(
          data['gameRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['games'],
        ),
        rentValue: deserializeParam(
          data['rentValue'],
          ParamType.double,
          false,
        ),
        isAvailableToRent: deserializeParam(
          data['isAvailableToRent'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'GameToAddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GameToAddStruct &&
        gameRef == other.gameRef &&
        rentValue == other.rentValue &&
        isAvailableToRent == other.isAvailableToRent;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([gameRef, rentValue, isAvailableToRent]);
}

GameToAddStruct createGameToAddStruct({
  DocumentReference? gameRef,
  double? rentValue,
  bool? isAvailableToRent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GameToAddStruct(
      gameRef: gameRef,
      rentValue: rentValue,
      isAvailableToRent: isAvailableToRent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GameToAddStruct? updateGameToAddStruct(
  GameToAddStruct? gameToAdd, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gameToAdd
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGameToAddStructData(
  Map<String, dynamic> firestoreData,
  GameToAddStruct? gameToAdd,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gameToAdd == null) {
    return;
  }
  if (gameToAdd.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gameToAdd.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gameToAddData = getGameToAddFirestoreData(gameToAdd, forFieldValue);
  final nestedData = gameToAddData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gameToAdd.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGameToAddFirestoreData(
  GameToAddStruct? gameToAdd, [
  bool forFieldValue = false,
]) {
  if (gameToAdd == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gameToAdd.toMap());

  // Add any Firestore field values
  gameToAdd.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGameToAddListFirestoreData(
  List<GameToAddStruct>? gameToAdds,
) =>
    gameToAdds?.map((e) => getGameToAddFirestoreData(e, true)).toList() ?? [];
