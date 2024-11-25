// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgesStruct extends FFFirebaseStruct {
  BadgesStruct({
    String? id,
    String? name,
    String? description,
    String? iconUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _description = description,
        _iconUrl = iconUrl,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "iconUrl" field.
  String? _iconUrl;
  String get iconUrl => _iconUrl ?? '';
  set iconUrl(String? val) => _iconUrl = val;

  bool hasIconUrl() => _iconUrl != null;

  static BadgesStruct fromMap(Map<String, dynamic> data) => BadgesStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        iconUrl: data['iconUrl'] as String?,
      );

  static BadgesStruct? maybeFromMap(dynamic data) =>
      data is Map ? BadgesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'iconUrl': _iconUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'iconUrl': serializeParam(
          _iconUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static BadgesStruct fromSerializableMap(Map<String, dynamic> data) =>
      BadgesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        iconUrl: deserializeParam(
          data['iconUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BadgesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BadgesStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, description, iconUrl]);
}

BadgesStruct createBadgesStruct({
  String? id,
  String? name,
  String? description,
  String? iconUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BadgesStruct(
      id: id,
      name: name,
      description: description,
      iconUrl: iconUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BadgesStruct? updateBadgesStruct(
  BadgesStruct? badges, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    badges
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBadgesStructData(
  Map<String, dynamic> firestoreData,
  BadgesStruct? badges,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (badges == null) {
    return;
  }
  if (badges.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && badges.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final badgesData = getBadgesFirestoreData(badges, forFieldValue);
  final nestedData = badgesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = badges.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBadgesFirestoreData(
  BadgesStruct? badges, [
  bool forFieldValue = false,
]) {
  if (badges == null) {
    return {};
  }
  final firestoreData = mapToFirestore(badges.toMap());

  // Add any Firestore field values
  badges.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBadgesListFirestoreData(
  List<BadgesStruct>? badgess,
) =>
    badgess?.map((e) => getBadgesFirestoreData(e, true)).toList() ?? [];
