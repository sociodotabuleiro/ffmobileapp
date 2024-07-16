// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GameReviewStruct extends FFFirebaseStruct {
  GameReviewStruct({
    String? gameReviewId,
    DocumentReference? user,
    int? rating,
    String? comment,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _gameReviewId = gameReviewId,
        _user = user,
        _rating = rating,
        _comment = comment,
        _date = date,
        super(firestoreUtilData);

  // "gameReviewId" field.
  String? _gameReviewId;
  String get gameReviewId => _gameReviewId ?? '';
  set gameReviewId(String? val) => _gameReviewId = val;

  bool hasGameReviewId() => _gameReviewId != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;

  void incrementRating(int amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;

  bool hasComment() => _comment != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static GameReviewStruct fromMap(Map<String, dynamic> data) =>
      GameReviewStruct(
        gameReviewId: data['gameReviewId'] as String?,
        user: data['user'] as DocumentReference?,
        rating: castToType<int>(data['rating']),
        comment: data['comment'] as String?,
        date: data['date'] as DateTime?,
      );

  static GameReviewStruct? maybeFromMap(dynamic data) => data is Map
      ? GameReviewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gameReviewId': _gameReviewId,
        'user': _user,
        'rating': _rating,
        'comment': _comment,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gameReviewId': serializeParam(
          _gameReviewId,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static GameReviewStruct fromSerializableMap(Map<String, dynamic> data) =>
      GameReviewStruct(
        gameReviewId: deserializeParam(
          data['gameReviewId'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'GameReviewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GameReviewStruct &&
        gameReviewId == other.gameReviewId &&
        user == other.user &&
        rating == other.rating &&
        comment == other.comment &&
        date == other.date;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([gameReviewId, user, rating, comment, date]);
}

GameReviewStruct createGameReviewStruct({
  String? gameReviewId,
  DocumentReference? user,
  int? rating,
  String? comment,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GameReviewStruct(
      gameReviewId: gameReviewId,
      user: user,
      rating: rating,
      comment: comment,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GameReviewStruct? updateGameReviewStruct(
  GameReviewStruct? gameReview, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gameReview
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGameReviewStructData(
  Map<String, dynamic> firestoreData,
  GameReviewStruct? gameReview,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gameReview == null) {
    return;
  }
  if (gameReview.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gameReview.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gameReviewData = getGameReviewFirestoreData(gameReview, forFieldValue);
  final nestedData = gameReviewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gameReview.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGameReviewFirestoreData(
  GameReviewStruct? gameReview, [
  bool forFieldValue = false,
]) {
  if (gameReview == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gameReview.toMap());

  // Add any Firestore field values
  gameReview.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGameReviewListFirestoreData(
  List<GameReviewStruct>? gameReviews,
) =>
    gameReviews?.map((e) => getGameReviewFirestoreData(e, true)).toList() ?? [];
