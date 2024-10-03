// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PixKeyStruct extends FFFirebaseStruct {
  PixKeyStruct({
    String? id,
    String? key,
    String? type,
    String? status,
    String? dateCreated,
    bool? canBeDeleted,
    String? cannotBeDeletedReason,
    QrCodeStruct? qrCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _key = key,
        _type = type,
        _status = status,
        _dateCreated = dateCreated,
        _canBeDeleted = canBeDeleted,
        _cannotBeDeletedReason = cannotBeDeletedReason,
        _qrCode = qrCode,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '51dd3178-7f2c-4210-b98c-eab575b0a6bd';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "key" field.
  String? _key;
  String get key => _key ?? 'b1484262-4f12-4d82-9406-5bea18c1119e';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "type" field.
  String? _type;
  String get type => _type ?? 'EVP';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "status" field.
  String? _status;
  String get status => _status ?? 'ACTIVE';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "dateCreated" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '2024-09-24 19:50:31';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "canBeDeleted" field.
  bool? _canBeDeleted;
  bool get canBeDeleted => _canBeDeleted ?? true;
  set canBeDeleted(bool? val) => _canBeDeleted = val;

  bool hasCanBeDeleted() => _canBeDeleted != null;

  // "cannotBeDeletedReason" field.
  String? _cannotBeDeletedReason;
  String get cannotBeDeletedReason => _cannotBeDeletedReason ?? '';
  set cannotBeDeletedReason(String? val) => _cannotBeDeletedReason = val;

  bool hasCannotBeDeletedReason() => _cannotBeDeletedReason != null;

  // "qrCode" field.
  QrCodeStruct? _qrCode;
  QrCodeStruct get qrCode => _qrCode ?? QrCodeStruct();
  set qrCode(QrCodeStruct? val) => _qrCode = val;

  void updateQrCode(Function(QrCodeStruct) updateFn) {
    updateFn(_qrCode ??= QrCodeStruct());
  }

  bool hasQrCode() => _qrCode != null;

  static PixKeyStruct fromMap(Map<String, dynamic> data) => PixKeyStruct(
        id: data['id'] as String?,
        key: data['key'] as String?,
        type: data['type'] as String?,
        status: data['status'] as String?,
        dateCreated: data['dateCreated'] as String?,
        canBeDeleted: data['canBeDeleted'] as bool?,
        cannotBeDeletedReason: data['cannotBeDeletedReason'] as String?,
        qrCode: QrCodeStruct.maybeFromMap(data['qrCode']),
      );

  static PixKeyStruct? maybeFromMap(dynamic data) =>
      data is Map ? PixKeyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'key': _key,
        'type': _type,
        'status': _status,
        'dateCreated': _dateCreated,
        'canBeDeleted': _canBeDeleted,
        'cannotBeDeletedReason': _cannotBeDeletedReason,
        'qrCode': _qrCode?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'dateCreated': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'canBeDeleted': serializeParam(
          _canBeDeleted,
          ParamType.bool,
        ),
        'cannotBeDeletedReason': serializeParam(
          _cannotBeDeletedReason,
          ParamType.String,
        ),
        'qrCode': serializeParam(
          _qrCode,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PixKeyStruct fromSerializableMap(Map<String, dynamic> data) =>
      PixKeyStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['dateCreated'],
          ParamType.String,
          false,
        ),
        canBeDeleted: deserializeParam(
          data['canBeDeleted'],
          ParamType.bool,
          false,
        ),
        cannotBeDeletedReason: deserializeParam(
          data['cannotBeDeletedReason'],
          ParamType.String,
          false,
        ),
        qrCode: deserializeStructParam(
          data['qrCode'],
          ParamType.DataStruct,
          false,
          structBuilder: QrCodeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PixKeyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PixKeyStruct &&
        id == other.id &&
        key == other.key &&
        type == other.type &&
        status == other.status &&
        dateCreated == other.dateCreated &&
        canBeDeleted == other.canBeDeleted &&
        cannotBeDeletedReason == other.cannotBeDeletedReason &&
        qrCode == other.qrCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        key,
        type,
        status,
        dateCreated,
        canBeDeleted,
        cannotBeDeletedReason,
        qrCode
      ]);
}

PixKeyStruct createPixKeyStruct({
  String? id,
  String? key,
  String? type,
  String? status,
  String? dateCreated,
  bool? canBeDeleted,
  String? cannotBeDeletedReason,
  QrCodeStruct? qrCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PixKeyStruct(
      id: id,
      key: key,
      type: type,
      status: status,
      dateCreated: dateCreated,
      canBeDeleted: canBeDeleted,
      cannotBeDeletedReason: cannotBeDeletedReason,
      qrCode: qrCode ?? (clearUnsetFields ? QrCodeStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PixKeyStruct? updatePixKeyStruct(
  PixKeyStruct? pixKey, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pixKey
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPixKeyStructData(
  Map<String, dynamic> firestoreData,
  PixKeyStruct? pixKey,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pixKey == null) {
    return;
  }
  if (pixKey.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pixKey.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pixKeyData = getPixKeyFirestoreData(pixKey, forFieldValue);
  final nestedData = pixKeyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pixKey.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPixKeyFirestoreData(
  PixKeyStruct? pixKey, [
  bool forFieldValue = false,
]) {
  if (pixKey == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pixKey.toMap());

  // Handle nested data for "qrCode" field.
  addQrCodeStructData(
    firestoreData,
    pixKey.hasQrCode() ? pixKey.qrCode : null,
    'qrCode',
    forFieldValue,
  );

  // Add any Firestore field values
  pixKey.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPixKeyListFirestoreData(
  List<PixKeyStruct>? pixKeys,
) =>
    pixKeys?.map((e) => getPixKeyFirestoreData(e, true)).toList() ?? [];
