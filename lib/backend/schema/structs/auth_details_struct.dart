// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthDetailsStruct extends FFFirebaseStruct {
  AuthDetailsStruct({
    String? userID,
    AuthMethods? method,
    String? jwtTokenHash,
    String? refreshToken,
    String? issuer,
    String? subject,
    String? audience,
    DateTime? issuedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userID = userID,
        _method = method,
        _jwtTokenHash = jwtTokenHash,
        _refreshToken = refreshToken,
        _issuer = issuer,
        _subject = subject,
        _audience = audience,
        _issuedAt = issuedAt,
        super(firestoreUtilData);

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;
  bool hasUserID() => _userID != null;

  // "method" field.
  AuthMethods? _method;
  AuthMethods? get method => _method;
  set method(AuthMethods? val) => _method = val;
  bool hasMethod() => _method != null;

  // "jwtTokenHash" field.
  String? _jwtTokenHash;
  String get jwtTokenHash => _jwtTokenHash ?? '';
  set jwtTokenHash(String? val) => _jwtTokenHash = val;
  bool hasJwtTokenHash() => _jwtTokenHash != null;

  // "refreshToken" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;
  bool hasRefreshToken() => _refreshToken != null;

  // "issuer" field.
  String? _issuer;
  String get issuer => _issuer ?? '';
  set issuer(String? val) => _issuer = val;
  bool hasIssuer() => _issuer != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;
  bool hasSubject() => _subject != null;

  // "audience" field.
  String? _audience;
  String get audience => _audience ?? '';
  set audience(String? val) => _audience = val;
  bool hasAudience() => _audience != null;

  // "issuedAt" field.
  DateTime? _issuedAt;
  DateTime? get issuedAt => _issuedAt;
  set issuedAt(DateTime? val) => _issuedAt = val;
  bool hasIssuedAt() => _issuedAt != null;

  static AuthDetailsStruct fromMap(Map<String, dynamic> data) =>
      AuthDetailsStruct(
        userID: data['userID'] as String?,
        method: deserializeEnum<AuthMethods>(data['method']),
        jwtTokenHash: data['jwtTokenHash'] as String?,
        refreshToken: data['refreshToken'] as String?,
        issuer: data['issuer'] as String?,
        subject: data['subject'] as String?,
        audience: data['audience'] as String?,
        issuedAt: data['issuedAt'] as DateTime?,
      );

  static AuthDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userID': _userID,
        'method': _method?.serialize(),
        'jwtTokenHash': _jwtTokenHash,
        'refreshToken': _refreshToken,
        'issuer': _issuer,
        'subject': _subject,
        'audience': _audience,
        'issuedAt': _issuedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'method': serializeParam(
          _method,
          ParamType.Enum,
        ),
        'jwtTokenHash': serializeParam(
          _jwtTokenHash,
          ParamType.String,
        ),
        'refreshToken': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'issuer': serializeParam(
          _issuer,
          ParamType.String,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'audience': serializeParam(
          _audience,
          ParamType.String,
        ),
        'issuedAt': serializeParam(
          _issuedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AuthDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthDetailsStruct(
        userID: deserializeParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        method: deserializeParam<AuthMethods>(
          data['method'],
          ParamType.Enum,
          false,
        ),
        jwtTokenHash: deserializeParam(
          data['jwtTokenHash'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refreshToken'],
          ParamType.String,
          false,
        ),
        issuer: deserializeParam(
          data['issuer'],
          ParamType.String,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        audience: deserializeParam(
          data['audience'],
          ParamType.String,
          false,
        ),
        issuedAt: deserializeParam(
          data['issuedAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AuthDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthDetailsStruct &&
        userID == other.userID &&
        method == other.method &&
        jwtTokenHash == other.jwtTokenHash &&
        refreshToken == other.refreshToken &&
        issuer == other.issuer &&
        subject == other.subject &&
        audience == other.audience &&
        issuedAt == other.issuedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userID,
        method,
        jwtTokenHash,
        refreshToken,
        issuer,
        subject,
        audience,
        issuedAt
      ]);
}

AuthDetailsStruct createAuthDetailsStruct({
  String? userID,
  AuthMethods? method,
  String? jwtTokenHash,
  String? refreshToken,
  String? issuer,
  String? subject,
  String? audience,
  DateTime? issuedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuthDetailsStruct(
      userID: userID,
      method: method,
      jwtTokenHash: jwtTokenHash,
      refreshToken: refreshToken,
      issuer: issuer,
      subject: subject,
      audience: audience,
      issuedAt: issuedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuthDetailsStruct? updateAuthDetailsStruct(
  AuthDetailsStruct? authDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    authDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuthDetailsStructData(
  Map<String, dynamic> firestoreData,
  AuthDetailsStruct? authDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (authDetails == null) {
    return;
  }
  if (authDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && authDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final authDetailsData =
      getAuthDetailsFirestoreData(authDetails, forFieldValue);
  final nestedData =
      authDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = authDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuthDetailsFirestoreData(
  AuthDetailsStruct? authDetails, [
  bool forFieldValue = false,
]) {
  if (authDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(authDetails.toMap());

  // Add any Firestore field values
  authDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuthDetailsListFirestoreData(
  List<AuthDetailsStruct>? authDetailss,
) =>
    authDetailss?.map((e) => getAuthDetailsFirestoreData(e, true)).toList() ??
    [];
