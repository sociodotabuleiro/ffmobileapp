// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameRentalInfoStruct extends FFFirebaseStruct {
  GameRentalInfoStruct({
    DocumentReference? gameID,
    DateTime? rentalDate,
    DateTime? dueDate,
    RentalStatus? status,
    DateTime? currentStatusTime,
    List<DateTime>? pastTimes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _gameID = gameID,
        _rentalDate = rentalDate,
        _dueDate = dueDate,
        _status = status,
        _currentStatusTime = currentStatusTime,
        _pastTimes = pastTimes,
        super(firestoreUtilData);

  // "gameID" field.
  DocumentReference? _gameID;
  DocumentReference? get gameID => _gameID;
  set gameID(DocumentReference? val) => _gameID = val;

  bool hasGameID() => _gameID != null;

  // "rentalDate" field.
  DateTime? _rentalDate;
  DateTime? get rentalDate => _rentalDate;
  set rentalDate(DateTime? val) => _rentalDate = val;

  bool hasRentalDate() => _rentalDate != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  set dueDate(DateTime? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "status" field.
  RentalStatus? _status;
  RentalStatus get status => _status ?? RentalStatus.initiated;
  set status(RentalStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "currentStatusTime" field.
  DateTime? _currentStatusTime;
  DateTime? get currentStatusTime => _currentStatusTime;
  set currentStatusTime(DateTime? val) => _currentStatusTime = val;

  bool hasCurrentStatusTime() => _currentStatusTime != null;

  // "pastTimes" field.
  List<DateTime>? _pastTimes;
  List<DateTime> get pastTimes => _pastTimes ?? const [];
  set pastTimes(List<DateTime>? val) => _pastTimes = val;

  void updatePastTimes(Function(List<DateTime>) updateFn) {
    updateFn(_pastTimes ??= []);
  }

  bool hasPastTimes() => _pastTimes != null;

  static GameRentalInfoStruct fromMap(Map<String, dynamic> data) =>
      GameRentalInfoStruct(
        gameID: data['gameID'] as DocumentReference?,
        rentalDate: data['rentalDate'] as DateTime?,
        dueDate: data['dueDate'] as DateTime?,
        status: data['status'] is RentalStatus
            ? data['status']
            : deserializeEnum<RentalStatus>(data['status']),
        currentStatusTime: data['currentStatusTime'] as DateTime?,
        pastTimes: getDataList(data['pastTimes']),
      );

  static GameRentalInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? GameRentalInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gameID': _gameID,
        'rentalDate': _rentalDate,
        'dueDate': _dueDate,
        'status': _status?.serialize(),
        'currentStatusTime': _currentStatusTime,
        'pastTimes': _pastTimes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gameID': serializeParam(
          _gameID,
          ParamType.DocumentReference,
        ),
        'rentalDate': serializeParam(
          _rentalDate,
          ParamType.DateTime,
        ),
        'dueDate': serializeParam(
          _dueDate,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'currentStatusTime': serializeParam(
          _currentStatusTime,
          ParamType.DateTime,
        ),
        'pastTimes': serializeParam(
          _pastTimes,
          ParamType.DateTime,
          isList: true,
        ),
      }.withoutNulls;

  static GameRentalInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      GameRentalInfoStruct(
        gameID: deserializeParam(
          data['gameID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['games'],
        ),
        rentalDate: deserializeParam(
          data['rentalDate'],
          ParamType.DateTime,
          false,
        ),
        dueDate: deserializeParam(
          data['dueDate'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam<RentalStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        currentStatusTime: deserializeParam(
          data['currentStatusTime'],
          ParamType.DateTime,
          false,
        ),
        pastTimes: deserializeParam<DateTime>(
          data['pastTimes'],
          ParamType.DateTime,
          true,
        ),
      );

  @override
  String toString() => 'GameRentalInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GameRentalInfoStruct &&
        gameID == other.gameID &&
        rentalDate == other.rentalDate &&
        dueDate == other.dueDate &&
        status == other.status &&
        currentStatusTime == other.currentStatusTime &&
        listEquality.equals(pastTimes, other.pastTimes);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [gameID, rentalDate, dueDate, status, currentStatusTime, pastTimes]);
}

GameRentalInfoStruct createGameRentalInfoStruct({
  DocumentReference? gameID,
  DateTime? rentalDate,
  DateTime? dueDate,
  RentalStatus? status,
  DateTime? currentStatusTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GameRentalInfoStruct(
      gameID: gameID,
      rentalDate: rentalDate,
      dueDate: dueDate,
      status: status,
      currentStatusTime: currentStatusTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GameRentalInfoStruct? updateGameRentalInfoStruct(
  GameRentalInfoStruct? gameRentalInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gameRentalInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGameRentalInfoStructData(
  Map<String, dynamic> firestoreData,
  GameRentalInfoStruct? gameRentalInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gameRentalInfo == null) {
    return;
  }
  if (gameRentalInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gameRentalInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gameRentalInfoData =
      getGameRentalInfoFirestoreData(gameRentalInfo, forFieldValue);
  final nestedData =
      gameRentalInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gameRentalInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGameRentalInfoFirestoreData(
  GameRentalInfoStruct? gameRentalInfo, [
  bool forFieldValue = false,
]) {
  if (gameRentalInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gameRentalInfo.toMap());

  // Add any Firestore field values
  gameRentalInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGameRentalInfoListFirestoreData(
  List<GameRentalInfoStruct>? gameRentalInfos,
) =>
    gameRentalInfos
        ?.map((e) => getGameRentalInfoFirestoreData(e, true))
        .toList() ??
    [];
