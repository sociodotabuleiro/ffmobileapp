// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SignUpRequestStruct extends FFFirebaseStruct {
  SignUpRequestStruct({
    String? idToken,
    DocumentReference? user,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idToken = idToken,
        _user = user,
        super(firestoreUtilData);

  // "id_token" field.
  String? _idToken;
  String get idToken => _idToken ?? '';
  set idToken(String? val) => _idToken = val;

  bool hasIdToken() => _idToken != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  static SignUpRequestStruct fromMap(Map<String, dynamic> data) =>
      SignUpRequestStruct(
        idToken: data['id_token'] as String?,
        user: data['user'] as DocumentReference?,
      );

  static SignUpRequestStruct? maybeFromMap(dynamic data) => data is Map
      ? SignUpRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id_token': _idToken,
        'user': _user,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_token': serializeParam(
          _idToken,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SignUpRequestStruct fromSerializableMap(Map<String, dynamic> data) =>
      SignUpRequestStruct(
        idToken: deserializeParam(
          data['id_token'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'SignUpRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SignUpRequestStruct &&
        idToken == other.idToken &&
        user == other.user;
  }

  @override
  int get hashCode => const ListEquality().hash([idToken, user]);
}

SignUpRequestStruct createSignUpRequestStruct({
  String? idToken,
  DocumentReference? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SignUpRequestStruct(
      idToken: idToken,
      user: user,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SignUpRequestStruct? updateSignUpRequestStruct(
  SignUpRequestStruct? signUpRequest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    signUpRequest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSignUpRequestStructData(
  Map<String, dynamic> firestoreData,
  SignUpRequestStruct? signUpRequest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (signUpRequest == null) {
    return;
  }
  if (signUpRequest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && signUpRequest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final signUpRequestData =
      getSignUpRequestFirestoreData(signUpRequest, forFieldValue);
  final nestedData =
      signUpRequestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = signUpRequest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSignUpRequestFirestoreData(
  SignUpRequestStruct? signUpRequest, [
  bool forFieldValue = false,
]) {
  if (signUpRequest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(signUpRequest.toMap());

  // Add any Firestore field values
  signUpRequest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSignUpRequestListFirestoreData(
  List<SignUpRequestStruct>? signUpRequests,
) =>
    signUpRequests
        ?.map((e) => getSignUpRequestFirestoreData(e, true))
        .toList() ??
    [];
