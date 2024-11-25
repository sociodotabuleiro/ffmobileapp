// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReviewStruct extends FFFirebaseStruct {
  UserReviewStruct({
    DocumentReference? user,
    int? rating,
    String? comment,
    DateTime? date,
    DocumentReference? userIdReview,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _rating = rating,
        _comment = comment,
        _date = date,
        _userIdReview = userIdReview,
        super(firestoreUtilData);

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

  // "userIdReview" field.
  DocumentReference? _userIdReview;
  DocumentReference? get userIdReview => _userIdReview;
  set userIdReview(DocumentReference? val) => _userIdReview = val;

  bool hasUserIdReview() => _userIdReview != null;

  static UserReviewStruct fromMap(Map<String, dynamic> data) =>
      UserReviewStruct(
        user: data['user'] as DocumentReference?,
        rating: castToType<int>(data['rating']),
        comment: data['comment'] as String?,
        date: data['date'] as DateTime?,
        userIdReview: data['userIdReview'] as DocumentReference?,
      );

  static UserReviewStruct? maybeFromMap(dynamic data) => data is Map
      ? UserReviewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'rating': _rating,
        'comment': _comment,
        'date': _date,
        'userIdReview': _userIdReview,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
        'userIdReview': serializeParam(
          _userIdReview,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserReviewStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserReviewStruct(
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
        userIdReview: deserializeParam(
          data['userIdReview'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'UserReviewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserReviewStruct &&
        user == other.user &&
        rating == other.rating &&
        comment == other.comment &&
        date == other.date &&
        userIdReview == other.userIdReview;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([user, rating, comment, date, userIdReview]);
}

UserReviewStruct createUserReviewStruct({
  DocumentReference? user,
  int? rating,
  String? comment,
  DateTime? date,
  DocumentReference? userIdReview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserReviewStruct(
      user: user,
      rating: rating,
      comment: comment,
      date: date,
      userIdReview: userIdReview,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserReviewStruct? updateUserReviewStruct(
  UserReviewStruct? userReview, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userReview
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserReviewStructData(
  Map<String, dynamic> firestoreData,
  UserReviewStruct? userReview,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userReview == null) {
    return;
  }
  if (userReview.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userReview.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userReviewData = getUserReviewFirestoreData(userReview, forFieldValue);
  final nestedData = userReviewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userReview.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserReviewFirestoreData(
  UserReviewStruct? userReview, [
  bool forFieldValue = false,
]) {
  if (userReview == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userReview.toMap());

  // Add any Firestore field values
  userReview.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserReviewListFirestoreData(
  List<UserReviewStruct>? userReviews,
) =>
    userReviews?.map((e) => getUserReviewFirestoreData(e, true)).toList() ?? [];
