// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TokenModelStruct extends FFFirebaseStruct {
  TokenModelStruct({
    String? idToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idToken = idToken,
        super(firestoreUtilData);

  // "id_token" field.
  String? _idToken;
  String get idToken => _idToken ?? '';
  set idToken(String? val) => _idToken = val;

  bool hasIdToken() => _idToken != null;

  static TokenModelStruct fromMap(Map<String, dynamic> data) =>
      TokenModelStruct(
        idToken: data['id_token'] as String?,
      );

  static TokenModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TokenModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id_token': _idToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_token': serializeParam(
          _idToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static TokenModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TokenModelStruct(
        idToken: deserializeParam(
          data['id_token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TokenModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokenModelStruct && idToken == other.idToken;
  }

  @override
  int get hashCode => const ListEquality().hash([idToken]);
}

TokenModelStruct createTokenModelStruct({
  String? idToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TokenModelStruct(
      idToken: idToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TokenModelStruct? updateTokenModelStruct(
  TokenModelStruct? tokenModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tokenModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTokenModelStructData(
  Map<String, dynamic> firestoreData,
  TokenModelStruct? tokenModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tokenModel == null) {
    return;
  }
  if (tokenModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tokenModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tokenModelData = getTokenModelFirestoreData(tokenModel, forFieldValue);
  final nestedData = tokenModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tokenModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTokenModelFirestoreData(
  TokenModelStruct? tokenModel, [
  bool forFieldValue = false,
]) {
  if (tokenModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tokenModel.toMap());

  // Add any Firestore field values
  tokenModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTokenModelListFirestoreData(
  List<TokenModelStruct>? tokenModels,
) =>
    tokenModels?.map((e) => getTokenModelFirestoreData(e, true)).toList() ?? [];
